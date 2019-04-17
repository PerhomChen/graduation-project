package entity.user;

import java.sql.Timestamp;

public class Cart {
    private Integer cartId;
    private Integer uid;
    private Integer goodId;
    private Timestamp createTime;
    private Integer goodNum;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Timestamp getCreatetime() {
        return createTime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createTime = createtime;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", uid=" + uid +
                ", goodId=" + goodId +
                ", createTime=" + createTime +
                ", goodNum=" + goodNum +
                '}';
    }
}
