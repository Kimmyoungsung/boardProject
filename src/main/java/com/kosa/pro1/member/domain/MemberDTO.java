package com.kosa.pro1.member.domain;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	
	// 회원 정보를 나타내는 클래스
	
	private String uid;		// 회원 아이디
	private String name;	// 회원 이름
	private String pwd;		// 회원 비밀번호
	private String phone;	// 회원 전화번호
	private String email;	// 회원 이메일 주소
	private String address;	// 회원 주소
	private int age;		// 회원 나이
	private String gender;	// 회원 성별
	
	
	// 비밀번호 비교 메서드
	public boolean isEqualPwd(MemberDTO member) {
		return pwd.equals(pwd);
	// 입력된 비밀번호와 회원 객체의 비밀번호를 비교하여 동일한지 여부를 반환합니다. (비교가 잘못되었습니다. 올바른 비교는 member.pwd.equals(this.pwd) 여야 합니다.)
	}
}
