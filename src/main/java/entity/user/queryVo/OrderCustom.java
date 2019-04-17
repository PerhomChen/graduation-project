package entity.user.queryVo;

import entity.user.Detail;
import entity.user.Order;

import java.util.List;

/**
 * 订单的详细信息
 */
public class OrderCustom extends Order {


    //order detail
    //detail has goods;
    private List<DetailCustom> detailCustomList;

    //
    private List<Detail> detailList;

    public List<Detail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<Detail> detailList) {
        this.detailList = detailList;
    }

    public List<DetailCustom> getDetailCustomList() {
        return detailCustomList;
    }

    public void setDetailCustomList(List<DetailCustom> detailCustomList) {
        this.detailCustomList = detailCustomList;
    }

    @Override
    public String toString() {
        return "OrderCustom{" +
                "detailCustomList=" + detailCustomList +
                ", detailList=" + detailList +
                '}';
    }
}
