package com.entity;

/**
 * Created by qiuje on 2017/9/18.
 */
public class Faq {
    private int faqId;
    private String faqTheme;
    private  String faq;
    private Object faqTime;
    public Faq(){}

    public int getFaqId() {
        return faqId;
    }

    public void setFaqId(int faqId) {
        this.faqId = faqId;
    }

    public String getFaqTheme() {
        return faqTheme;
    }

    public void setFaqTheme(String faqTheme) {
        this.faqTheme = faqTheme;
    }

    public String getFaq() {
        return faq;
    }

    public void setFaq(String faq) {
        this.faq = faq;
    }

    public Object getFaqTime() {
        return faqTime;
    }

    public void setFaqTime(Object faqTime) {
        this.faqTime = faqTime;
    }
}
