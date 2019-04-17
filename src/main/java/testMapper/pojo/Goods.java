package testMapper.pojo;

import java.sql.Date;

public class Goods {
    private Integer good_id;
    private String good_name;
    private Date createtime;
    private String detail;
    private String pic;
    private Double price;
    private Integer size;
    private Integer ex_number;
    private  Integer sale_number;

    public String getGood_name() {
        return good_name;
    }

    public void setGood_name(String good_name) {
        this.good_name = good_name;
    }

    private Integer type;

    public Integer getGood_id() {
        return good_id;
    }

    public void setGood_id(Integer good_id) {
        this.good_id = good_id;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getEx_number() {
        return ex_number;
    }

    public void setEx_number(Integer ex_number) {
        this.ex_number = ex_number;
    }

    public Integer getSale_number() {
        return sale_number;
    }

    public void setSale_number(Integer sale_number) {
        this.sale_number = sale_number;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
