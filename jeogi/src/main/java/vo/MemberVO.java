package vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(of= {"uid", "upw", "uname"})
@AllArgsConstructor
public class MemberVO {
	
	@Setter
	private String uno;
	
	@Getter
	@Setter
	private String uid;
	
	@Getter
	@Setter
	private String uemail;
	
	@Getter
	@Setter
	private String upw;
	
	@Getter
	@Setter
	private String uname;
	
	@Getter
	@Setter
	private String uphone;
	
	@Getter
	@Setter
	private String utype;
	
}
