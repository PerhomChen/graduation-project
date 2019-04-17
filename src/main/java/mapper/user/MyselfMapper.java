package mapper.user;

import entity.user.Myself;
import entity.user.MyselfExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MyselfMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    long countByExample(MyselfExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int deleteByExample(MyselfExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer myselfId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int insert(Myself record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int insertSelective(Myself record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    List<Myself> selectByExample(MyselfExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    Myself selectByPrimaryKey(Integer myselfId);

    /*select MyselfByUid*/
    Myself selectByUid(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Myself record, @Param("example") MyselfExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Myself record, @Param("example") MyselfExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Myself record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_myself
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Myself record);
}