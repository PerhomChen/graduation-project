package mapper.user;

import entity.user.Address;
import entity.user.AddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {


    List<Address> selectByUid (Integer uid);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    long countByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int deleteByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int insert(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int insertSelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    List<Address> selectByExample(AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    Address selectByPrimaryKey(Integer addressId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Address record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_address
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Address record);
}