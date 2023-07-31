package com.healpio.member;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healpio.mapper.MemberMapper;
import com.healpio.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest {

    @Autowired
    MemberMapper memberMapper;

    @Test
    public void test() {
        MemberVO memberVo = new MemberVO();
        memberVo.setMember_id("member1");
        memberVo.setMember_pw("password");
        memberVo = memberMapper.login(memberVo);

        log.info(memberVo);
        assertNotNull(memberVo);
    }

    @Test
    public void testIdCheck() {
        MemberVO member = new MemberVO();
        member.setMember_id("member1");

        int res = memberMapper.idCheck(member);

        assertEquals(1, res);
    }

}
