package mapper.staff;

import entity.staff.Super;
import entity.staff.SuperExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LSuperMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    long countByExample(SuperExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int deleteByExample(SuperExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer superId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int insert(Super record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int insertSelective(Super record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    List<Super> selectByExample(SuperExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Super record, @Param("example") SuperExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_super
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Super record, @Param("example") SuperExample example);
}