package com.xidian.dataAccess;

import java.util.List;
import java.util.Map;

public interface Dao {
	public Map<String, Object> executeQuery(String sqlId, Map<String, Object> map);

	public int executeUpdate(String sqlId, Map<String, Object> map);

	public int[] executeBatchUpdate(String sqlId, Map<String, Object>[] map);

	public int query4int(String sqlId, Map<String, Object> map);

	public List<Map<String, Object>> query4List(String sqlId, Map<String, Object> map);

	public Map<String, Object> pageQuery(String sqlId, Map<String, Object> paramMap, int pageNo, int pageSize);
}