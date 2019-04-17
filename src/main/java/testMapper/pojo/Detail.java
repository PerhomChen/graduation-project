package testMapper.pojo;

/**
 * 订单明细表
 */
public class Detail {
    private Integer detail_id;
    private Integer order_id;
    private Integer good_id;

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getGood_id() {
        return good_id;
    }

    public void setGood_id(int good_id) {
        this.good_id = good_id;
    }

    @Override
    public String toString() {
        return "Detail{" +
                "detail_id=" + detail_id +
                ", order_id=" + order_id +
                ", good_id=" + good_id +
                '}';
    }
}
