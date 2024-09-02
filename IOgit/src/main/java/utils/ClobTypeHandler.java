package utils;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.io.Reader;
import java.sql.*;

public class ClobTypeHandler implements TypeHandler<String> {

    @Override
    public void setParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
        if (parameter != null) {
            Reader reader = new java.io.StringReader(parameter);
            ps.setCharacterStream(i, reader, parameter.length());
        } else {
            ps.setNull(i, Types.CLOB);
        }
    }

    @Override
    public String getResult(ResultSet rs, String columnName) throws SQLException {
        Clob clob = rs.getClob(columnName);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }

    @Override
    public String getResult(ResultSet rs, int columnIndex) throws SQLException {
        Clob clob = rs.getClob(columnIndex);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }

    @Override
    public String getResult(CallableStatement cs, int columnIndex) throws SQLException {
        Clob clob = cs.getClob(columnIndex);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }
}
