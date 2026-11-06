<!DOCTYPE html>
<html lang="zh-CN">
 <head> 
  <title>节点列表 — {$config['appName']}</title>
 </head>
 <body>
   {include file='user/header.tpl'} 
  <!-- BEGIN: Content--> 
  <div class="app-content content"> 
   <div class="content-overlay"></div> 
   <div class="header-navbar-shadow"></div> 
   <div class="content-wrapper"> 
    <div class="content-header row"> 
     <div class="content-header-left col-md-9 col-12 mb-2"> 
      <div class="row breadcrumbs-top"> 
       <div class="col-12"> 
        <h2 class="content-header-title float-left mb-0">节点列表</h2> 
        <div class="breadcrumb-wrapper col-12"> 
         <ol class="breadcrumb"> 
          <li class="breadcrumb-item"><a href="/user">Home</a> </li> 
          <li class="breadcrumb-item"><a href="/user/node">Server List</a> </li> 
         </ol> 
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
    
	{if $Cool_Config['show_node_select'] == true}
		<div class="card">
	        <div class="form-inline" style="padding: 15px 0px 15px 20px;border-bottom: 1px solid gainsboro;">
	        	<h4 style="padding-top: 8px;">线路筛选</h4>&nbsp;&nbsp;
	        </div>
	        <div class="card-body">
	            <p><strong>线路简介</strong>：希望您按照标签来选择节点使用，这会更好的满足您的服务需求。</p>
	            <p><strong>各类标签</strong>：流量倍率 -> 你使用 0.2 倍率的节点，消耗 1G 流量，则统计为 0.2G；速率 -> 标示速率为最高速率，但会受限于您本地网络、目标网络等；等级 -> 与会员套餐匹配；在线、负载 -> 表示节点当前使用人数，过载可能会影响线路体验...</p>
	        </div>
	        <div class="node-body">
	            <div class="form-group">
	                  <label><strong>国家</strong></label>
	                  <select class="form-control" id="region-selector" onchange="changeRegion()">
	                    <option value="all">全部</option>
	                    <option value="hk">香港（中国）</option>
	                    <option value="tw">台湾（中国）</option>
	                    <option value="us">美国</option>
	                    <option value="jp">日本</option>
	                    <option value="kr">韩国</option>
	                    <option value="au">澳大利亚</option>
	                    <option value="sg">新加坡</option>
	                    <option value="cn">中国（回国）</option>
	                  </select>
	            </div>
	            <div class="custom-switches-stacked">
	                <div class="row" onchange="changeRegion()">
		                <div class="custom-control custom-switch col-sm-2 col-lg-2 ml-1 mb-1">
		                    <input type="radio" class="custom-control-input" name="option" value="all" id="customSwitch1">
		                    <label class="custom-control-label" for="customSwitch1"></label>
		                    <span class="custom-switch-description">全部</span>
		                </div>
		                
	                	{foreach $Cool_Config["node_select"] as $arr}
			                <div class="custom-control custom-switch col-sm-2 col-lg-2 ml-1 mb-1">
			                    <input type="radio" class="custom-control-input" name="option" value="{$arr['label']}" id="customSwitch{$arr['id']}">
			                    <label class="custom-control-label" for="customSwitch{$arr['id']}"></label>
			                    <span class="custom-switch-description">{$arr['label']}</span>
			                </div>
			            {/foreach}
			            
	                </div>
	            </div>
	        </div>
	    </div>
    {/if}
    
    {assign var=flags value=['美国'=>'us','香港'=>'hk','新加'=>'sg','日本'=>'jp','回国'=>'cn','中国'=>'cn','台湾'=> 'tw','菲律'=>'ph','俄罗'=>'ru','韩国'=>'kr','德国'=>'de','英国'=>'gb','法国'=>'fr','越南'=>'vn','印度'=>'in','印尼'=>'id','澳门'=>'mo','马来'=>'my','荷兰'=>'nl','罗马'=>'ro','澳大'=>'au']}
    {if $Cool_Config['show_welfare_nodes'] == true }
		<div class="card"> 
			<div class="card-header" style="border-bottom: 1px solid gainsboro;padding-bottom: 20px;"> 
				<h4 class="card-title"> 公益节点</h4> 
			</div> 
	    	<div class="section-bod" style="background: linear-gradient(87deg,#f7fafc 0,#f7f8fc 100%)!important;">
              <div class="row ">
                {foreach $nodes as $node}
                {if $node['class'] == 0}
	               <div class="col-12 col-sm-12 col-lg-6">
	                {if $node['mu_only'] != 1 && ($node['sort'] != 11 || $node['sort']!=12)}
	                    <div class="card-node" onclick="urlChange('{$node['id']}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">
	                    
	                {elseif $node['sort'] == 11}
	                    <div class="card-node" data-toggle="modal" data-target="#node-modal-{$node['id']}">
               
	                {elseif ($node['sort'] == 0 || $node['sort'] == 10) && $node['mu_only'] != -1}
	                    {if $Cool_Config['node_Single_port'] == true}
    	                	<div class="card-node" {if $user->class >= 0} data-toggle="modal" data-target="#node-{$node['id']}" {else}onclick="UserClassinsufficient()"{/if}>
                        	   <!-- node info Modal -->
                        		<div class="modal fade" id="node-{$node['id']}" tabindex="-1" role="dialog" aria-labelledby="node-ipModalLabel" aria-hidden="true">
                        		  <div class="modal-dialog" role="document">
                        		    <div class="modal-content">
                        		      <div class="modal-header">
                        		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        		          <span aria-hidden="true">&times;</span>
                        		        </button>
                        		      </div>
                        		      <div class="modal-body">
            	        				{foreach $nodes_muport as $single_muport}
            	        				
                                            {if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
                                                    {continue}
                                            {/if}
                                                
                                            {$relay_rule = null}    
                                                
                							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
                								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
                							{/if}
                						
                            				<div class="tiptitle" style="text-align:center">
                                                <a href="javascript:void(0);"
                                                   onClick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">
                                                    {$node['name']}{if $relay_rule != null}{/if} - 单端口{$single_muport['server']->server}
                                                </a>
                                            </div>
                                     	{/foreach}
                        		      </div>
                        		    </div>
                        		  </div>
                        		</div>
                        {else}
                            {foreach $nodes_muport as $single_muport}
							    {$relay_rule = null}
							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
							{/if}
	                	    <div class="card-node" onclick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" >
	                		{/foreach}
                        {/if}
	                {/if}
                      <div class="card-body" style="background-color: #FFFFFF;border-radius: 0.5rem;">
                        <ul class="list-unstyled user-details list-unstyled-border list-unstyled-noborder">
                          <li class="media">
                            {$region = substr($node['name'],0,6)}
                            <img alt="image" class="mr-2 rounded-circle" width="50" height="50" src="/theme/cool/assets/modules/flag-icon-css/flags/1x1/{if $flags[$region] != ''}{$flags[$region]}{else}un{/if}.svg">
                            <div class="media-body">
                              <div class="media-title node-status {if $node['online']=='1'}node-is-online{elseif $node['online']=='0'}node-is-suspended{else}node-is-offline{/if}">{current(explode(" - ", $node['name']))}</div>
                          <div class=" text-job text-muted">{$node['info']}</div>
                            </div>
                            <div class="media-items">
                              {if $Cool_Config['show_online_user'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $user->isAdmin()}{$node['online_user']}{else}{if $node['online_user'] == -1} N/A{else} {if $node['online_user'] > '10'}多{elseif $node['online_user'] <5}少{else}中{/if}{/if}{/if}</div>
                                <div class="media-label">在线</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_rate'] == true}
                              <div class="media-item">
                                <div class="media-value">x{$node['traffic_rate']}</div>
                                <div class="media-label">倍率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_load'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}</div>
                                <div class="media-label">负载</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_speedlimit'] == true}
                              <div class="media-item">
                                <div class="media-value">{if {$node['bandwidth']}==0}N/A{else}{$node['bandwidth']}{/if}</div>
                                <div class="media-label">速率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_used'] == true}
                            <div class="media-item">
	                              <div class="media-value">{if $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}{else}{$node['traffic_used']}/∞{/if}</div>
	                              <div class="media-label">流量</div>
	                         </div>
	                        {/if}
                            
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  {/if}
                  {/foreach}
                </div>
            </div>
		</div>
	{/if}
		
		<div class="card"> 
			<div class="card-header" style="border-bottom: 1px solid gainsboro;padding-bottom: 20px;"> 
				<h4 class="card-title"> VIP1 节点列表</h4> 
			</div> 
	    	<div class="section-bod" style="background: linear-gradient(87deg,#f7fafc 0,#f7f8fc 100%)!important;">
              <div class="row">
                {foreach $nodes as $node}
                {if $node['class'] == 1}
	               <div class="col-12 col-sm-12 col-lg-6">
	                  
	                {if $node['mu_only'] != 1 && ($node['sort'] != 11 || $node['sort']!=12)}
	                    <div class="card-node" {if $user->class >= 1}onclick="urlChange('{$node['id']}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif $node['sort'] == 11}
	                    <div class="card-node" {if $user->class>=1} data-toggle="modal" data-target="#node-modal-{$node['id']}"{else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif ($node['sort'] == 0 || $node['sort'] == 10) && $node['mu_only'] != -1}
	                    {if $Cool_Config['node_Single_port'] == true}
    	                	<div class="card-node" {if $user->class >= 1} data-toggle="modal" data-target="#node1-{$node['id']}" {else}onclick="UserClassinsufficient()"{/if}>
                        	   <!-- node info Modal -->
                        		<div class="modal fade" id="node1-{$node['id']}" tabindex="-1" role="dialog" aria-labelledby="node-ipModalLabel" aria-hidden="true">
                        		  <div class="modal-dialog" role="document">
                        		    <div class="modal-content">
                        		      <div class="modal-header">
                        		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        		          <span aria-hidden="true">&times;</span>
                        		        </button>
                        		      </div>
                        		      <div class="modal-body">
            	        				{foreach $nodes_muport as $single_muport}
            							    {$relay_rule = null}
            							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
            								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
            							{/if}
                            				<div class="tiptitle" style="text-align:center">
                                                <a href="javascript:void(0);"
                                                   onClick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">
                                                    {$node['name']}{if $relay_rule != null}{/if} - 单端口{$single_muport['server']->server}
                                                </a>
                                            </div>
                                     	{/foreach}
                        		      </div>
                        		    </div>
                        		  </div>
                        		</div>
                        {else}
	        				{foreach $nodes_muport as $single_muport}
							    {$relay_rule = null}
							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
							{/if}
	                	    <div class="card-node" {if $user->class >= 1}onclick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                		{/foreach}
                        {/if}
	                {/if}
                      <div class="card-body" style="background-color: #FFFFFF;border-radius: 0.5rem;">
                        <ul class="list-unstyled user-details list-unstyled-border list-unstyled-noborder">
                          <li class="media">
                            {$region = substr($node['name'],0,6)}
                            <img alt="image" class="mr-2 rounded-circle" width="50" height="50" src="/theme/cool/assets/modules/flag-icon-css/flags/1x1/{if $flags[$region] != ''}{$flags[$region]}{else}un{/if}.svg">
                            <div class="media-body">
                              <div class="media-title node-status {if $node['online']=='1'}node-is-online{elseif $node['online']=='0'}node-is-suspended{else}node-is-offline{/if}">{current(explode(" - ", $node['name']))}</div>
                              
                          <div class=" text-job text-muted">{$node['info']}</div>
                            </div>
                            <div class="media-items">
                              {if $Cool_Config['show_online_user'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $user->isAdmin()}{$node['online_user']}{else}{if $node['online_user'] == -1} N/A{else} {if $node['online_user'] > '10'}多{elseif $node['online_user'] <5}少{else}中{/if}{/if}{/if}</div>
                                <div class="media-label">在线</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_rate'] == true}
                              <div class="media-item">
                                <div class="media-value">x{$node['traffic_rate']}</div>
                                <div class="media-label">倍率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_load'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}</div>
                                <div class="media-label">负载</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_speedlimit'] == true}
                              <div class="media-item">
                                <div class="media-value">{if {$node['bandwidth']}==0}N/A{else}{$node['bandwidth']}{/if}</div>
                                <div class="media-label">速率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_used'] == true}
                            <div class="media-item">
	                              <div class="media-value">{if $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}{else}{$node['traffic_used']}/∞{/if}</div>
	                              <div class="media-label">流量</div>
	                         </div>
	                        {/if}
                            
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  {/if}
                  {/foreach}
                </div>
            </div>
		</div>
		<div class="card"> 
			<div class="card-header" style="border-bottom: 1px solid gainsboro;padding-bottom: 20px;"> 
				<h4 class="card-title"> VIP2 节点列表</h4> 
			</div> 
	    	<div class="section-bod" style="background: linear-gradient(87deg,#f7fafc 0,#f7f8fc 100%)!important;">
              <div class="row ">
                {foreach $nodes as $node}
                {if $node['class'] == 2}
	               <div class="col-12 col-sm-12 col-lg-6">
	                  
	                {if $node['mu_only'] != 1 && ($node['sort'] != 11 || $node['sort']!=12)}
	                    <div class="card-node" {if $user->class >= 2}onclick="urlChange('{$node['id']}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif $node['sort'] == 11}
	                    <div class="card-node" {if $user->class >= 2} data-toggle="modal" data-target="#node-modal-{$node['id']}"{else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif ($node['sort'] == 0 || $node['sort'] == 10) && $node['mu_only'] != -1}
	                    {if $Cool_Config['node_Single_port'] == true}
    	                	<div class="card-node" {if $user->class >= 2} data-toggle="modal" data-target="#node2-{$node['id']}" {else}onclick="UserClassinsufficient()"{/if}>
                        	   <!-- node info Modal -->
                        		<div class="modal fade" id="node2-{$node['id']}" tabindex="-1" role="dialog" aria-labelledby="node-ipModalLabel" aria-hidden="true">
                        		  <div class="modal-dialog" role="document">
                        		    <div class="modal-content">
                        		      <div class="modal-header">
                        		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        		          <span aria-hidden="true">&times;</span>
                        		        </button>
                        		      </div>
                        		      <div class="modal-body">
            	        				{foreach $nodes_muport as $single_muport}
            							    {$relay_rule = null}
            							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
            								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
            							{/if}
                            				<div class="tiptitle" style="text-align:center">
                                                <a href="javascript:void(0);"
                                                   onClick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">
                                                    {$node['name']}{if $relay_rule != null}{/if} - 单端口{$single_muport['server']->server}
                                                </a>
                                            </div>
                                     	{/foreach}
                        		      </div>
                        		    </div>
                        		  </div>
                        		</div>
                        {else}
	        				{foreach $nodes_muport as $single_muport}
							    {$relay_rule = null}
							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
							{/if}
	                	    <div class="card-node" {if $user->class >= 2}onclick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                		{/foreach}
                        {/if}
	                {/if}
                      <div class="card-body" style="background-color: #FFFFFF;border-radius: 0.5rem;">
                        <ul class="list-unstyled user-details list-unstyled-border list-unstyled-noborder">
                          <li class="media">
                            {$region = substr($node['name'],0,6)}
                            <img alt="image" class="mr-2 rounded-circle" width="50" height="50" src="/theme/cool/assets/modules/flag-icon-css/flags/1x1/{if $flags[$region] != ''}{$flags[$region]}{else}un{/if}.svg">
                            <div class="media-body">
                              <div class="media-title node-status {if $node['online']=='1'}node-is-online{elseif $node['online']=='0'}node-is-suspended{else}node-is-offline{/if}">{current(explode(" - ", $node['name']))}</div>
                          <div class=" text-job text-muted">{$node['info']}</div>
                            </div>
                            <div class="media-items">
                              {if $Cool_Config['show_online_user'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $user->isAdmin()}{$node['online_user']}{else}{if $node['online_user'] == -1} N/A{else} {if $node['online_user'] > '10'}多{elseif $node['online_user'] <5}少{else}中{/if}{/if}{/if}</div>
                                <div class="media-label">在线</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_rate'] == true}
                              <div class="media-item">
                                <div class="media-value">x{$node['traffic_rate']}</div>
                                <div class="media-label">倍率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_load'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}</div>
                                <div class="media-label">负载</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_speedlimit'] == true}
                              <div class="media-item">
                                <div class="media-value">{if {$node['bandwidth']}==0}N/A{else}{$node['bandwidth']}{/if}</div>
                                <div class="media-label">速率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_used'] == true}
                            <div class="media-item">
	                              <div class="media-value">{if $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}{else}{$node['traffic_used']}/∞{/if}</div>
	                              <div class="media-label">流量</div>
	                         </div>
	                        {/if}
                            
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  {/if}
                  {/foreach}
                </div>
            </div>
		</div>
		<div class="card"> 
			<div class="card-header" style="border-bottom: 1px solid gainsboro;padding-bottom: 20px;"> 
				<h4 class="card-title"> VIP3 节点列表</h4> 
			</div> 
	    	<div class="section-bod" style="background: linear-gradient(87deg,#f7fafc 0,#f7f8fc 100%)!important;">
              <div class="row ">
                {foreach $nodes as $node}
                {if $node['class'] == 3}
	               <div class="col-12 col-sm-12 col-lg-6">
	                {if $node['mu_only'] != 1 && ($node['sort'] != 11 || $node['sort']!=12)}
	                    <div class="card-node" {if $user->class >= 3}onclick="urlChange('{$node['id']}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif $node['sort'] == 11}
	                    <div class="card-node" {if $user->class >= 3} data-toggle="modal" data-target="#node-modal-{$node['id']}"{else}onclick="UserClassinsufficient()"{/if}>
	                    
	                {elseif ($node['sort'] == 0 || $node['sort'] == 10) && $node['mu_only'] != -1}
	                    {if $Cool_Config['node_Single_port'] == true}
    	                	<div class="card-node" {if $user->class >= 3} data-toggle="modal" data-target="#node3-{$node['id']}" {else}onclick="UserClassinsufficient()"{/if}>
                        	   <!-- node info Modal -->
                        		<div class="modal fade" id="node3-{$node['id']}" tabindex="-1" role="dialog" aria-labelledby="node-ipModalLabel" aria-hidden="true">
                        		  <div class="modal-dialog" role="document">
                        		    <div class="modal-content">
                        		      <div class="modal-header">
                        		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        		          <span aria-hidden="true">&times;</span>
                        		        </button>
                        		      </div>
                        		      <div class="modal-body">
            	        				{foreach $nodes_muport as $single_muport}
            							    {$relay_rule = null}
            							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
            								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
            							{/if}
                            				<div class="tiptitle" style="text-align:center">
                                                <a href="javascript:void(0);"
                                                   onClick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">
                                                    {$node['name']}{if $relay_rule != null}{/if} - 单端口{$single_muport['server']->server}
                                                </a>
                                            </div>
                                     	{/foreach}
                        		      </div>
                        		    </div>
                        		  </div>
                        		</div>
                        {else}
	        				{foreach $nodes_muport as $single_muport}
							    {$relay_rule = null}
							{if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2}
								{$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)}
							{/if}
	                	    <div class="card-node" {if $user->class >= 3}onclick="urlChange('{$node['id']}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})" {else}onclick="UserClassinsufficient()"{/if}>
	                		{/foreach}
                        {/if}
	                {/if}
                      <div class="card-body" style="background-color: #FFFFFF;border-radius: 0.5rem;">
                        <ul class="list-unstyled user-details list-unstyled-border list-unstyled-noborder">
                          <li class="media">
                            {$region = substr($node['name'],0,6)}
                            <img alt="image" class="mr-2 rounded-circle" width="50" height="50" src="/theme/cool/assets/modules/flag-icon-css/flags/1x1/{if $flags[$region] != ''}{$flags[$region]}{else}un{/if}.svg">
                            <div class="media-body">
                              <div class="media-title node-status {if $node['online']=='1'}node-is-online{elseif $node['online']=='0'}node-is-suspended{else}node-is-offline{/if}">{current(explode(" - ", $node['name']))}</div>
                          <div class=" text-job text-muted">{$node['info']}</div>
                            </div>
                            <div class="media-items">
                              {if $Cool_Config['show_online_user'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $user->isAdmin()}{$node['online_user']}{else}{if $node['online_user'] == -1} N/A{else} {if $node['online_user'] > '10'}多{elseif $node['online_user'] <5}少{else}中{/if}{/if}{/if}</div>
                                <div class="media-label">在线</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_rate'] == true}
                              <div class="media-item">
                                <div class="media-value">x{$node['traffic_rate']}</div>
                                <div class="media-label">倍率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_load'] == true}
                              <div class="media-item">
                                <div class="media-value">{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}</div>
                                <div class="media-label">负载</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_speedlimit'] == true}
                              <div class="media-item">
                                <div class="media-value">{if {$node['bandwidth']}==0}N/A{else}{$node['bandwidth']}{/if}</div>
                                <div class="media-label">速率</div>
                              </div>
                              {/if}
                              {if $Cool_Config['show_node_traffic_used'] == true}
                            <div class="media-item">
	                              <div class="media-value">{if $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}{else}{$node['traffic_used']}/∞{/if}</div>
	                              <div class="media-label">流量</div>
	                         </div>
	                        {/if}
                            
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  {/if}
                  {/foreach}
                </div>
            </div>
		</div>
		
		<!--  node_info -->
		<div class="modal fade" tabindex="-1" role="dialog" id="nodeinfo" aria-labelledby="nodeinfoModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			<div class="modal-header">
				<h4 id="nodeinfoModalLabel">节点详细信息</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
			</div>
				<iframe id="infoifram" style="display: block;border: none;width: 100%;height: 600px;margin: 0;padding: 0;over"></iframe>
			</div>
		  </div>
		</div>
		
		{foreach $nodes as $node}
  		{if $user->class >= $node['class']}
  		{if $node['sort'] == 11}
        <!-- v2ray配置信息 开始 --> 
        {$v2server=URL::getV2Url($user, $node['raw_node'], 1)}
         <div class="modal fade" tabindex="-1" role="dialog" id="node-modal-{$node['id']}"> 
          <div class="modal-dialog modal-dialog-centered" role="document"> 
           <div class="modal-content shadow"> 
            <div class="modal-header"> 
             <h5 class="modal-title"><strong>V2Ray-Lv.{$node['class']} {$node['name']}</strong></h5> 
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
            </div> 
            <div class="modal-body">
             <div class="mb-2">
              地址: 
              <code>{$v2server['add']}</code>
             </div> 
             <div class="mb-2">
              端口: 
              <code>{$v2server['port']}</code>
             </div> 
             <div class="mb-2">
              AlterId: 
              <code>{$v2server['aid']}</code>
             </div> 

             <div class="mb-2">
              用户 UUID: 
              <code>{$user->getUuid()}</code>
             </div> 

             <div class="mb-2">
              传输协议: 
              <code>{if $v2server['net']=="tls"}tcp{else}{$v2server['net']}{/if}</code>
             </div>

             {if $v2server['net']=="ws"}
               <div class="mb-2">
                路径: 
                <code>{$v2server['path']}</code>
               </div>
             {/if}

             {if ($v2server['net']=="ws" && $v2server['tls']=="tls")||$v2server['net']=="tls"||($v2server['net']=="tcp" && $v2server['tls']=="tls")}
               <div class="mb-2">
                TLS: 
                <code>TLS</code>
               </div> 
             {/if}   
                 <div class="mb-2">
                  VMess链接: 
                  <span class="btn btn-sm btn-primary copy-modal" data-clipboard-text="{URL::getV2Url($user, $node['raw_node'])}">点击复制</span> 
                 </div> 
                </div> 
               </div> 
              </div> 
             </div>  
  		{/if}
  		{/if}
		{/foreach}
   </div> 
  </div>
  <!-- END: Content--> 
  
 
  <!-- BEGIN: Footer--> 
	{include file='user/footer.tpl'} 
  <!-- END: Footer--> 
  
    <script type="text/javascript">
    	{literal}
	        $(document).ready(function(){
	          if (getQueryVariable('country') == '') {
	            $("#region-selector").val('all');
	          }else{
	            $("#region-selector").val(getQueryVariable('country'));
	          }
	          var des = getQueryVariable('tag');
	          if (getQueryVariable('tag') == '') {
	            $("input[type=radio][value='all']").prop("checked",true);
	          }else{
	            $("input[type=radio][value="+des+"]").prop("checked",true);
	          }
	        })
        {/literal}
	</script>

  <!-- END: Body--> 
 </body>
</html>