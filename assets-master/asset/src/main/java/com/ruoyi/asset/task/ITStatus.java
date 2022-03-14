package com.ruoyi.asset.task;

import java.net.InetAddress;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ruoyi.asset.domain.AssetIt;
import com.ruoyi.asset.service.IAssetItService;
import com.ruoyi.common.utils.StringUtils;

@Component("it")
public class ITStatus {

    @Autowired
    private IAssetItService assetItService;
    
	/**
	 * 定时任务入口
	 */
	@Scheduled(cron = "0 0/3 * * * ?")
	public void status() {
		List<AssetIt> list = assetItService.selectAssetItList(new AssetIt());
		for(AssetIt it : list) {
			if(StringUtils.isEmpty(it.getIp()) || !"2".equals(it.getAsset().getStatus())) {
				it.setIsOnline("N");
				assetItService.updateAssetIt(it);
				continue;
			}
			
			ping(it);
		}
	}
	
	private void ping(AssetIt it) {
		try {
			System.out.println("ping to " + it.getAsset().getNum() + " @ " + it.getIp());
			if(InetAddress.getByName(it.getIp()).isReachable(3000)){
				it.setIsOnline("Y");
				it.setLastTime(new Date());
			}else {
				it.setIsOnline("N");
			}
		}catch (Exception e) {
			it.setIsOnline("N");
			e.printStackTrace();
		}finally {
			assetItService.updateAssetIt(it);
		}		
	}
}
