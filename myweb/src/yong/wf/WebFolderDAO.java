package yong.wf;

import java.io.*;

public class WebFolderDAO {
	public static final String USERS_HOME = "C:/pys/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/webFolder/upload";
	private String userid; // 계정 정보를 담기위해 만든 변수
	private String crpath; // 현재 위치를 의미
	private int totalSize, usedSize, freeSize; //총 용량, 사용 용량, 남은 용량
	
	public WebFolderDAO(){
		totalSize = 1024 * 1024 * 10; //10메가
		freeSize = 0;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(int usedSize) {
		this.usedSize = usedSize;
	}

	public int getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
	}
	
	/**사용자 개인공간이 존재 유무*/
	public void userFolderExcists(){
		File f = new File(USERS_HOME + "/" + userid);
		if(!f.exists()){
			f.mkdir();
		}
		
		usedSize = 0;
		settingUsedSize(f);
		freeSize = totalSize - usedSize;
	}
	
	/**실제 용량을 구하는 메서드*/
	public void settingUsedSize(File f){
		File files[] = f.listFiles();
		
		for(int i = 0; i < files.length; i++){
			if(files[i].isFile()){
				usedSize += files[i].length();
			}else{
				settingUsedSize(files[i]);
			}
		}
	}
	
	/**파일 삭제 메서드*/
	public void delete(File f){
		if(f.isFile()){
			f.delete();
		}else{
			File files[] = f.listFiles();
			
			for(int i = 0; i < files.length; i++){
				if(files[i].isFile()){
					files[i].delete();
				}else{
					delete(files[i]);
					files[i].delete();
				}
			}
		}
	}
}
