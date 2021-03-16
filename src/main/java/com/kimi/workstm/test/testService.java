package com.kimi.workstm.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class testService {
	@Autowired
	private testDao test;
	
	public void insTesting() {
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		for(int i = 17 ; i < 40 ; i++) {
			pMap.put("nm", String.valueOf(i));
			pMap.put("id", String.valueOf(i));
			int r  = test.test(pMap);
			if(r > 0) {				
				System.out.println(i);
			}
			
		}
		
		
	}

}
