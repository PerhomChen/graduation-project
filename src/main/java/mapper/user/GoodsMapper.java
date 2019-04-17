package mapper.user;

import entity.user.Goods;
import entity.user.GoodsExample;
import entity.user.queryVo.GoodsCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {



    Integer selectByGoodsName(String goodName)throws Exception;


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    long countByExample(GoodsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int deleteByExample(GoodsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer goodId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int insert(Goods record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int insertSelective(Goods record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    List<Goods> selectByExample(GoodsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    Goods selectByPrimaryKey(Integer goodId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Goods record, @Param("example") GoodsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Goods record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_goods
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Goods record);
}