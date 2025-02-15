package com.project.aloneBab.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.exception.MemberException;
import com.project.aloneBab.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member findPw(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPw", m);
	}

	public void updatePwd(SqlSessionTemplate sqlSession, Member member) {
		sqlSession.update("memberMapper.updatePwd", member);
	}
	
	public int joinMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		int result = sqlSession.update("boardMapper.deleteBoard", id);
		
		if(result > 0) {
			return sqlSession.update("memberMapper.deleteMember", id);
		} else {
			throw new MemberException("게시글 삭제를 실패했습니다.");
		}
	}

	public int joinAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, String admin) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", admin);
	}

	public ArrayList<Member> selectSearchMember(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchMember", search);
	}

	public int updateAdminStatus(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateAdminStatus", m);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, Member m) {
		int bCount = sqlSession.selectOne("memberMapper.getBCount", m);
		int rCount = sqlSession.selectOne("memberMapper.getRCount", m);
		
		if(bCount > 0) {
			int result = sqlSession.update("memberMapper.updateBoard", m);
			
			if(result > 0) {
			} else {
				throw new MemberException("선택된 회원의 게시글 상태 변경을 실패하였습니다.");
			}
		}
		
		if(rCount > 0) {
			int rResult = sqlSession.update("memberMapper.updateReply", m);
			
			if(rResult <= 0) {
				throw new MemberException("선택된 회원의 댓글 상태 변경을 실패하였습니다.");
			}
		}
		
		return sqlSession.update("memberMapper.updateStatus", m);
	}

}
