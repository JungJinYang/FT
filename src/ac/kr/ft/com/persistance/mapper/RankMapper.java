package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.FestivalDTO;
import config.Mapper;

@Mapper("RankMapper")
public interface RankMapper {

	
	List<FestivalDTO> getRankList(FestivalDTO festivalDto) throws Exception;

	List<FestivalDTO> getBusiRankList(FestivalDTO festivalDto)	throws Exception;
	//�Խ��� ����Ʈ ũ�� ��������
	FestivalDTO getBusiRankListCnt(FestivalDTO festivalDto) throws Exception;

	
	
	
	/*List<FestivalDTO> getRankList2();
	List<FestivalDTO> getRankList3();
	List<FestivalDTO> getRankList4();*/

}

