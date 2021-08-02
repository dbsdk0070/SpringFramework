package com.spring.biz.board.service;

public class BoardVO {
	private String board_type, board_title, board_comment,
	               creator, create_time, modifier, modified_time, file_root;
	
	private Number board_num;
	
	public BoardVO() {
	
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_comment() {
		return board_comment;
	}

	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getModified_time() {
		return modified_time;
	}

	public void setModified_time(String modified_time) {
		this.modified_time = modified_time;
	}

	public String getFile_root() {
		return file_root;
	}

	public void setFile_root(String file_root) {
		this.file_root = file_root;
	}

	public Number getBoard_num() {
		return board_num;
	}

	public void setBoard_num(Number board_num) {
		this.board_num = board_num;
	}

	@Override
	public String toString() {
		return "BoardVO [board_type=" + board_type + ", board_title=" + board_title + ", board_comment=" + board_comment
				+ ", creator=" + creator + ", create_time=" + create_time + ", modifier=" + modifier
				+ ", modified_time=" + modified_time + ", file_root=" + file_root + ", board_num=" + board_num + "]";
	}
	
	
}
