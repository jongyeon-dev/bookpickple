package com.kh.bookpickple.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member implements Serializable{
	
	private static final long serialVersionUID = 1001L;
	
	private int userNo;
	private int gradeType;
	private String type;
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private String tel;
	private String birth;
	private String email;
	private String emailStatus;
	private String address;
	private Date joinDate;
	private int point;
	private String status;
	private Date delDate;

}
