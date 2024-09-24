import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.jeogi.customer.vo.InquiryVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/inquiries")
@RequiredArgsConstructor
public class InquiryController {

    private final InquiryService inquiryService;

    // 문의 등록
    @PostMapping("/add")
    public String addInquiry(@RequestBody InquiryVO inquiry) {
        inquiryService.insertInquiry(inquiry);
        return "Inquiry added successfully!";
    }

    // 문의 ID로 조회
    @GetMapping("/{id}")
    public InquiryVO getInquiryById(@PathVariable int id) {
        return inquiryService.getInquiryById(id);
    }

    // 모든 문의 조회
    @GetMapping("/all")
    public List<InquiryVO> getAllInquiries() {
        return inquiryService.getAllInquiries();
    }

    // 문의 상태 업데이트
    @PutMapping("/{id}/status")
    public String updateInquiryStatus(@PathVariable
O