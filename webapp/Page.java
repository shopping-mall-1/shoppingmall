package com.jsp.util;


public class Page {

	public String getPageList(int pageNum, int postNum, int listCount, int totalCount, String searchType, String keyword, int p_code) throws Exception {

	int totalPage = (int) Math.ceil(totalCount/(double)postNum); //전체 페이지 갯수
	int totalSection = (int) Math.ceil(totalPage/(double)listCount); //전체 섹션 개수
	
	pageNum = pageNum-1; //계산에 사용되는 페이지 번호는 0부터 시작
	int section = (int) Math.ceil(pageNum/listCount); //현재 위치한 섹션 번호	
	
	System.out.println("postNum = " + postNum);
	System.out.println("listCount = " + listCount);
	System.out.println("totalCount = " + totalCount);
	System.out.println("totalPage = " + totalPage);
	System.out.println("totalSection = " + totalSection);
	System.out.println("section = " + section);
	
	String pageList = "";
	
	
	if(totalPage != 1 )
	{
		for(int i=0; i < listCount ; i++){ 
			if(section > 0 && i == 0) 
				pageList +=	"<a href=productdetail.jsp?code=" + p_code + "&page=" + Integer.toString((section-1)*listCount+(listCount)) + "&searchType=" + searchType + "&keyword=" + keyword + ">◀</a> ";
			if(totalPage == (i+section*listCount)){  break; }
			if(pageNum != (section*listCount + i))
				pageList += " <a href=productdetail.jsp?code=" + p_code + "&page=" + Integer.toString(i+section*listCount+1) + "&searchType=" + searchType + "&keyword=" + keyword +">" + Integer.toString(i+section*listCount+1) + "</a> ";
			else pageList += " <span style='font-weight: bold'>" + Integer.toString(section*listCount+i+1) + "</span>";
			if(totalSection >1 && i==(listCount-1) && totalPage != (i+section*listCount+1)) 
				pageList += "<a href=productdetail.jsp?code=" + p_code + "&page=" + Integer.toString((section+1)*listCount+1) + "&searchType=" + searchType + "&keyword=" + keyword + ">▶</a>";
			
		}
 	} 
	return pageList = "[페이지] " + pageList; 
}
	
}
