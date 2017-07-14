package com.xidian.dataAccess.imp;

import com.xidian.dataAccess.Dao;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

public class DaoImp implements Dao {
    private NamedParameterJdbcTemplate jdbcTemplate;
    private Logger logger = Logger.getLogger(getClass());
    private Resource[] sqlTemplate;
    private Map<String, String> sqlTemplateMap = new HashMap<String, String>();

    public void setJdbcTemplate(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void setSqlTemplate(Resource[] sqlTemplate) {
        this.sqlTemplate = sqlTemplate;
    }

    @SuppressWarnings("unchecked")
    public void loadSqlTemplate() {
        logger.info("---------------加载sql模版	start---------------");
        if (this.sqlTemplate != null) {
            for (int m = 0; m < this.sqlTemplate.length; ++m) {
                SAXReader reader = new SAXReader();
                Document readDocument = null;
                try {
                    readDocument = reader.read(sqlTemplate[m].getFile());
                } catch (DocumentException e) {
                    e.printStackTrace();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                if (readDocument != null) {
                    Element readRoot = readDocument.getRootElement();
                    for (Iterator<Element> i = readRoot.elementIterator(); i.hasNext(); ) {
                        Element element = (Element) i.next();

                        String id = element.attributeValue("id");
                        String sql = element.getText();
                        logger.info(id + "---" + sql);
                        sqlTemplateMap.put(id, sql);
                    }
                }
            }
        }
        logger.info("---------------加载sql模版	end---------------");
    }

    private String getSqlById(String id) {
        return this.sqlTemplateMap.get(id);
    }

    @Override
    public Map<String, Object> executeQuery(String sqlId, Map<String, Object> map) {
        try {
            return this.jdbcTemplate.queryForMap(getSqlById(sqlId), map);
        } catch (Exception e) {
            logger.error("executeQuery---Exception", e);
            return new HashMap<String, Object>();
        }
    }

    @Override
    public int executeUpdate(String sqlId, Map<String, Object> map) {
        return this.jdbcTemplate.update(getSqlById(sqlId), map);
    }

    @Override
    public int[] executeBatchUpdate(String sqlId, Map<String, Object>[] map) {
        return this.jdbcTemplate.batchUpdate(getSqlById(sqlId), map);
    }

    @SuppressWarnings("deprecation")
    @Override
    public int query4int(String sqlId, Map<String, Object> map) {
        try {
            return this.jdbcTemplate.queryForInt(getSqlById(sqlId), map);
        } catch (Exception e) {
            logger.error("query4int---Exception", e);
            return 0;
        }
    }

    @Override
    public List<Map<String, Object>> query4List(String sqlId, Map<String, Object> map) {
        try {
            return this.jdbcTemplate.queryForList(getSqlById(sqlId), map);
        } catch (Exception e) {
            logger.error("query4List---Exception", e);
            return new ArrayList<Map<String, Object>>();
        }
    }

    private String getSqlTotal(String sql) {
        return new StringBuffer("select count(1) from (").append(sql).append(") _t").toString();
    }

    private String getSqlData(String sql, int start, int end) {
        return new StringBuffer("select _t.* from (").append(sql).append(") _t limit ").append(start).append(", ").append(end).toString();
    }

    @Override
    public Map<String, Object> pageQuery(String sqlId, Map<String, Object> paramMap, int pageIndex, int pageSize) {
        String sql = getSqlById(sqlId);
        if (pageSize <= 0 || pageSize > 50) {
            // TODO
        }
        int totalNum = this.jdbcTemplate.queryForInt(getSqlTotal(sql), paramMap);// 总的数量
        int totalPageNo = totalNum / pageSize;// 总的页数
        if (totalNum % pageSize != 0) {
            ++totalPageNo;
        }
        if (pageIndex <= 0) {
            pageIndex = 1;
        }
        if (pageIndex > totalPageNo) {
            pageIndex = totalPageNo;
        }
        List<Map<String, Object>> list = null;
        if (totalNum > 0) {
            list = this.jdbcTemplate.queryForList(getSqlData(sql, pageSize * (pageIndex - 1), pageSize * pageIndex), paramMap);
        }

        Map<String, Object> resMap = new HashMap<String, Object>();
        resMap.put("pageIndex", pageIndex);
        resMap.put("pageSize", pageSize);
        resMap.put("totalPage", totalPageNo);
        resMap.put("list", list != null ? list : new ArrayList<Map<String, Object>>());
        return resMap;
    }

}