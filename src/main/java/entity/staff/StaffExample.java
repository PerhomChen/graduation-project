package entity.staff;

import java.util.ArrayList;
import java.util.List;

public class StaffExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public StaffExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andStaffIdIsNull() {
            addCriterion("staff_id is null");
            return (Criteria) this;
        }

        public Criteria andStaffIdIsNotNull() {
            addCriterion("staff_id is not null");
            return (Criteria) this;
        }

        public Criteria andStaffIdEqualTo(Integer value) {
            addCriterion("staff_id =", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdNotEqualTo(Integer value) {
            addCriterion("staff_id <>", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdGreaterThan(Integer value) {
            addCriterion("staff_id >", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("staff_id >=", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdLessThan(Integer value) {
            addCriterion("staff_id <", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdLessThanOrEqualTo(Integer value) {
            addCriterion("staff_id <=", value, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdIn(List<Integer> values) {
            addCriterion("staff_id in", values, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdNotIn(List<Integer> values) {
            addCriterion("staff_id not in", values, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdBetween(Integer value1, Integer value2) {
            addCriterion("staff_id between", value1, value2, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffIdNotBetween(Integer value1, Integer value2) {
            addCriterion("staff_id not between", value1, value2, "staffId");
            return (Criteria) this;
        }

        public Criteria andStaffNameIsNull() {
            addCriterion("staff_name is null");
            return (Criteria) this;
        }

        public Criteria andStaffNameIsNotNull() {
            addCriterion("staff_name is not null");
            return (Criteria) this;
        }

        public Criteria andStaffNameEqualTo(String value) {
            addCriterion("staff_name =", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameNotEqualTo(String value) {
            addCriterion("staff_name <>", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameGreaterThan(String value) {
            addCriterion("staff_name >", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameGreaterThanOrEqualTo(String value) {
            addCriterion("staff_name >=", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameLessThan(String value) {
            addCriterion("staff_name <", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameLessThanOrEqualTo(String value) {
            addCriterion("staff_name <=", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameLike(String value) {
            addCriterion("staff_name like", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameNotLike(String value) {
            addCriterion("staff_name not like", value, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameIn(List<String> values) {
            addCriterion("staff_name in", values, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameNotIn(List<String> values) {
            addCriterion("staff_name not in", values, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameBetween(String value1, String value2) {
            addCriterion("staff_name between", value1, value2, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffNameNotBetween(String value1, String value2) {
            addCriterion("staff_name not between", value1, value2, "staffName");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordIsNull() {
            addCriterion("staff_password is null");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordIsNotNull() {
            addCriterion("staff_password is not null");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordEqualTo(String value) {
            addCriterion("staff_password =", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordNotEqualTo(String value) {
            addCriterion("staff_password <>", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordGreaterThan(String value) {
            addCriterion("staff_password >", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("staff_password >=", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordLessThan(String value) {
            addCriterion("staff_password <", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordLessThanOrEqualTo(String value) {
            addCriterion("staff_password <=", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordLike(String value) {
            addCriterion("staff_password like", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordNotLike(String value) {
            addCriterion("staff_password not like", value, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordIn(List<String> values) {
            addCriterion("staff_password in", values, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordNotIn(List<String> values) {
            addCriterion("staff_password not in", values, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordBetween(String value1, String value2) {
            addCriterion("staff_password between", value1, value2, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffPasswordNotBetween(String value1, String value2) {
            addCriterion("staff_password not between", value1, value2, "staffPassword");
            return (Criteria) this;
        }

        public Criteria andStaffLocationIsNull() {
            addCriterion("staff_location is null");
            return (Criteria) this;
        }

        public Criteria andStaffLocationIsNotNull() {
            addCriterion("staff_location is not null");
            return (Criteria) this;
        }

        public Criteria andStaffLocationEqualTo(Integer value) {
            addCriterion("staff_location =", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationNotEqualTo(Integer value) {
            addCriterion("staff_location <>", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationGreaterThan(Integer value) {
            addCriterion("staff_location >", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationGreaterThanOrEqualTo(Integer value) {
            addCriterion("staff_location >=", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationLessThan(Integer value) {
            addCriterion("staff_location <", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationLessThanOrEqualTo(Integer value) {
            addCriterion("staff_location <=", value, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationIn(List<Integer> values) {
            addCriterion("staff_location in", values, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationNotIn(List<Integer> values) {
            addCriterion("staff_location not in", values, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationBetween(Integer value1, Integer value2) {
            addCriterion("staff_location between", value1, value2, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffLocationNotBetween(Integer value1, Integer value2) {
            addCriterion("staff_location not between", value1, value2, "staffLocation");
            return (Criteria) this;
        }

        public Criteria andStaffSexIsNull() {
            addCriterion("staff_sex is null");
            return (Criteria) this;
        }

        public Criteria andStaffSexIsNotNull() {
            addCriterion("staff_sex is not null");
            return (Criteria) this;
        }

        public Criteria andStaffSexEqualTo(Boolean value) {
            addCriterion("staff_sex =", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexNotEqualTo(Boolean value) {
            addCriterion("staff_sex <>", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexGreaterThan(Boolean value) {
            addCriterion("staff_sex >", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexGreaterThanOrEqualTo(Boolean value) {
            addCriterion("staff_sex >=", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexLessThan(Boolean value) {
            addCriterion("staff_sex <", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexLessThanOrEqualTo(Boolean value) {
            addCriterion("staff_sex <=", value, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexIn(List<Boolean> values) {
            addCriterion("staff_sex in", values, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexNotIn(List<Boolean> values) {
            addCriterion("staff_sex not in", values, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexBetween(Boolean value1, Boolean value2) {
            addCriterion("staff_sex between", value1, value2, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffSexNotBetween(Boolean value1, Boolean value2) {
            addCriterion("staff_sex not between", value1, value2, "staffSex");
            return (Criteria) this;
        }

        public Criteria andStaffAgeIsNull() {
            addCriterion("staff_age is null");
            return (Criteria) this;
        }

        public Criteria andStaffAgeIsNotNull() {
            addCriterion("staff_age is not null");
            return (Criteria) this;
        }

        public Criteria andStaffAgeEqualTo(Byte value) {
            addCriterion("staff_age =", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeNotEqualTo(Byte value) {
            addCriterion("staff_age <>", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeGreaterThan(Byte value) {
            addCriterion("staff_age >", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeGreaterThanOrEqualTo(Byte value) {
            addCriterion("staff_age >=", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeLessThan(Byte value) {
            addCriterion("staff_age <", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeLessThanOrEqualTo(Byte value) {
            addCriterion("staff_age <=", value, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeIn(List<Byte> values) {
            addCriterion("staff_age in", values, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeNotIn(List<Byte> values) {
            addCriterion("staff_age not in", values, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeBetween(Byte value1, Byte value2) {
            addCriterion("staff_age between", value1, value2, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffAgeNotBetween(Byte value1, Byte value2) {
            addCriterion("staff_age not between", value1, value2, "staffAge");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneIsNull() {
            addCriterion("staff_phone is null");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneIsNotNull() {
            addCriterion("staff_phone is not null");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneEqualTo(String value) {
            addCriterion("staff_phone =", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneNotEqualTo(String value) {
            addCriterion("staff_phone <>", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneGreaterThan(String value) {
            addCriterion("staff_phone >", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("staff_phone >=", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneLessThan(String value) {
            addCriterion("staff_phone <", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneLessThanOrEqualTo(String value) {
            addCriterion("staff_phone <=", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneLike(String value) {
            addCriterion("staff_phone like", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneNotLike(String value) {
            addCriterion("staff_phone not like", value, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneIn(List<String> values) {
            addCriterion("staff_phone in", values, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneNotIn(List<String> values) {
            addCriterion("staff_phone not in", values, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneBetween(String value1, String value2) {
            addCriterion("staff_phone between", value1, value2, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffPhoneNotBetween(String value1, String value2) {
            addCriterion("staff_phone not between", value1, value2, "staffPhone");
            return (Criteria) this;
        }

        public Criteria andStaffMailIsNull() {
            addCriterion("staff_mail is null");
            return (Criteria) this;
        }

        public Criteria andStaffMailIsNotNull() {
            addCriterion("staff_mail is not null");
            return (Criteria) this;
        }

        public Criteria andStaffMailEqualTo(String value) {
            addCriterion("staff_mail =", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailNotEqualTo(String value) {
            addCriterion("staff_mail <>", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailGreaterThan(String value) {
            addCriterion("staff_mail >", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailGreaterThanOrEqualTo(String value) {
            addCriterion("staff_mail >=", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailLessThan(String value) {
            addCriterion("staff_mail <", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailLessThanOrEqualTo(String value) {
            addCriterion("staff_mail <=", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailLike(String value) {
            addCriterion("staff_mail like", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailNotLike(String value) {
            addCriterion("staff_mail not like", value, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailIn(List<String> values) {
            addCriterion("staff_mail in", values, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailNotIn(List<String> values) {
            addCriterion("staff_mail not in", values, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailBetween(String value1, String value2) {
            addCriterion("staff_mail between", value1, value2, "staffMail");
            return (Criteria) this;
        }

        public Criteria andStaffMailNotBetween(String value1, String value2) {
            addCriterion("staff_mail not between", value1, value2, "staffMail");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table l_staff
     *
     * @mbg.generated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table l_staff
     *
     * @mbg.generated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}