-- ===================================================================
--                          Assemble the data
--  Author:
--         ning.jun16@ztesoft.com
--  Purpose:
--         1. Assemble the data for batch checking in orders which
--            CRM removed.
--  NOTE:
--         1. The error_code should be 1211000309
-- ===================================================================
select '{"SITE_NO":"101","STAFF_NO":"113160","STAFF_JOB_ID":"1","DISPATCH_CODE":"","SERV_TYPE":"OK_SUCCESSREVOKE","INTERFACE_LIST":{"INTERFACE_ID":"' ||
        INTERFACE_ID || '", "OPER_STATE":"' || OPER_STATE || '", "ORD_NO":"' || ORD_NO || '","TASK_NO":"' || TASK_NO ||
        '", "SOURCE_ID":"' || SOURCE_ID || '", "OPER_CODE":"' || OPER_CODE ||
        '", "NOTES":"","WORKORDER_NAME":"Internal Archiving"' || ', "WORKORDER_NO":"' || TASK_NO || '"}},'
  from tip_interface_data a
 where a.workorder_type = 'WWWW_001'
   and a.oper_code = 'SOM_WF_ERROR_00001'
   and a.notes like '%error_code:1211000309%'  -- archived failed orders because CRM removed these orders
 order by a.notes;

-- check
select *
  from tip_adapter_log_detail
 where log_id in
       (select log_id
          from tip_adapter_log
         where interface_id in (select interface_id from tip_interface_data where ord_no = '20001091799075.1'))
 order by log_id desc;
 
select * from tip_adapter_log_his a where a.interface_id = '20160229100099549';
 
select * from tip_adapter_log_detail_his a where a.log_id = '20160229111042103374667';

select *
  from tip_adapter_log_detail_his
 where log_id in
       (select log_id
          from tip_adapter_log_his
         where interface_id in (select interface_id from tip_interface_data_his where ord_no = '20000766902334.1'))
 order by log_id desc;

 
 -- Get all archived failed orders because CRM removed these orders
select *
  from tip_interface_data a
 where a.workorder_type = 'WWWW_001'
   and a.oper_code = 'SOM_WF_ERROR_00001'
   and a.notes like '%error_code:1211000309%'
 order by a.notes;
