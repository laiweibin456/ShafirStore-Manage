package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.entity.Member;
import com.shafir.store.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/members")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/{id}")
    public Result<Member> getById(@PathVariable Long id) {
        log.info("查询会员详情: id={}", id);
        Member member = memberService.getById(id);
        return Result.success(member);
    }

    @GetMapping("/phone/{phone}")
    public Result<Member> getByPhone(@PathVariable String phone) {
        log.info("根据手机号查询会员: phone={}", phone);
        Member member = memberService.getByPhone(phone);
        return Result.success(member);
    }

    @GetMapping
    public Result<IPage<Member>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer level,
            @RequestParam(required = false) Integer status) {
        log.info("分页查询会员: pageNum={}, pageSize={}, keyword={}, level={}, status={}",
                pageNum, pageSize, keyword, level, status);
        IPage<Member> page = memberService.selectPage(pageNum, pageSize, keyword, level, status);
        return Result.success(page);
    }

    @GetMapping("/all")
    public Result<List<Member>> getAll() {
        log.info("获取所有会员列表");
        List<Member> members = memberService.getAllMembers();
        return Result.success(members);
    }

    @PostMapping
    public Result<Boolean> add(@RequestBody Member member) {
        log.info("新增会员: name={}, phone={}", member.getName(), member.getPhone());
        boolean result = memberService.addMember(member);
        return Result.success(result);
    }

    @PutMapping
    public Result<Boolean> update(@RequestBody Member member) {
        log.info("更新会员: id={}", member.getId());
        boolean result = memberService.updateMember(member);
        return Result.success(result);
    }

    @PutMapping("/{id}/status")
    public Result<Boolean> updateStatus(@PathVariable Long id, @RequestParam Integer status) {
        log.info("更新会员状态: id={}, status={}", id, status);
        boolean result = memberService.updateStatus(id, status);
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    public Result<Boolean> delete(@PathVariable Long id) {
        log.info("删除会员: id={}", id);
        boolean result = memberService.deleteMember(id);
        return Result.success(result);
    }

    @PostMapping("/points")
    public Result<Boolean> updatePoints(@RequestBody Map<String, Object> params) {
        Long memberId = Long.valueOf(params.get("memberId").toString());
        Integer points = Integer.valueOf(params.get("points").toString());
        Integer type = Integer.valueOf(params.get("type").toString());
        Long orderId = params.get("orderId") != null ? Long.valueOf(params.get("orderId").toString()) : null;
        String remark = (String) params.get("remark");

        log.info("更新会员积分: memberId={}, points={}, type={}", memberId, points, type);
        boolean result = memberService.updatePoints(memberId, points, type, orderId, remark);
        return Result.success(result);
    }

    @GetMapping("/count")
    public Result<Integer> getCount() {
        log.info("获取会员数量");
        int count = memberService.getMemberCount();
        return Result.success(count);
    }

    @GetMapping("/top")
    public Result<List<Member>> getTopMembers(@RequestParam(defaultValue = "10") Integer limit) {
        log.info("获取消费TOP会员: limit={}", limit);
        List<Member> members = memberService.getTopMembers(limit);
        return Result.success(members);
    }
}
