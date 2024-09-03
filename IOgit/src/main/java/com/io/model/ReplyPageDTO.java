package com.io.model;

import lombok.Data;
import java.util.List;

@Data
public class ReplyPageDTO {
    private List<ReplyVO> list;
    private int total;

    public ReplyPageDTO(List<ReplyVO> list, int total) {
        this.list = list;
        this.total = total;
    }
}