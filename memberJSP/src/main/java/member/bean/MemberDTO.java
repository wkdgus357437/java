package member.bean;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


//@Data
@Setter
@Getter
@NoArgsConstructor
@RequiredArgsConstructor
public class MemberDTO {
	@NonNull //->바로 아래 또는 옆에 꺼에 적용 (null을 허용하지 않을 경우)
	private String name;
	private String id;
	private String pwd;
	private String gender;
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String zipcode;
	private String addr1;
	private String addr2;
	
}

//@Data -> 모든것 
//기본생성자 -> @NoArgsConstructor -> ()안에 아무것도 없는
//setter /getter ->@Setter / @Getter
//to striong ()
//hashcode ()
