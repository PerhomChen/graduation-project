package testMapper.pojo;

import java.sql.Date;

public class Order {
    private Integer order_id;
    private Integer u_id;
    private Date createTime;
    private Integer status;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", u_id=" + u_id +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }
}
