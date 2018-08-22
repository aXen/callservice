﻿--================================
--      Assemble the data
--================================
select '{"ORDER_NBR":"' || a.ord_no || '","REASON":"pause for Ethiopian Airline","OPERATION_TYPE":"1","ASK_NO":"' || a.ask_no || '"},'
  from tom_exec_order a
 where a.ask_no in
       ('20001166324438', '20001166322800', '20001166321196', '20001166321178', '20001166319837', '20001166318157', '20001166318136', '20001166316561', '20001166316532', '20001166314657', '20001166314629', '20001166313603', '20001166313509', '20001166313581', '20001166313464', '20001166312146', '20001166311986', '20001166312112', '20001166310302', '20001166311044', '20001166309301', '20001166310262', '20001166309281', '20001166308866', '20001166307953', '20001166307645', '20001166307918', '20001166307615', '20001166306433', '20001166305935', '20001166306415', '20001166304353', '20001166305370', '20001166303745', '20001166304326', '20001166303715', '20001166302497', '20001166303221', '20001166302468', '20001166301894', '20001166300845', '20001166301862', '20001166300818', '20001166298789', '20001166298549', '20001166298770', '20001166298522', '20001166297259', '20001166297617', '20001166297218', '20001166296206', '20001166296172', '20001166295876', '20001166294922', '20001166293901', '20001166294235', '20001166293883', '20001166293108', '20001166292011', '20001166293080', '20001166291969', '20001166291836', '20001166290504', '20001166290484', '20001166289157', '20001166287409', '20001166287940', '20001166287364', '20001166285590', '20001166285568', '20001166284544', '20001166282744', '20001166279993', '20001166278605', '20001166276564', '20001166274276', '20001166272625', '20001166271333', '20001166199033', '20001166199023', '20001166197359', '20001166197331', '20001166197320', '20001166196739', '20001166196003', '20001166196716', '20001166195979', '20001166195046', '20001166193955', '20001166195019', '20001166193926', '20001166193913', '20001166193224', '20001166191849', '20001166191943', '20001166191831', '20001166191914', '20001166190642', '20001166190689', '20001166189656', '20001166189094', '20001166189624', '20001166189076', '20001166188195', '20001166187692', '20001166188169', '20001166186994', '20001166187663', '20001166186975', '20001166186340', '20001166186153', '20001166185059', '20001166184902', '20001166185029', '20001166184872', '20001166184240', '20001166183693', '20001166182886', '20001166181456', '20001166179857', '20001166179823', '20001166178338', '20001166178576', '20001166177138', '20001166176053', '20001166176108', '20001166176080', '20001166176015', '20001166174706', '20001166174719', '20001166174667', '20001166173825', '20001166174169', '20001166172930', '20001166172718', '20001166172363', '20001166171495', '20001166170352', '20001166170767', '20001166170328', '20001166169280', '20001166168383', '20001166168051', '20001166166945', '20001166166644', '20001166165403', '20001166165489', '20001166165375', '20001166164436', '20001166164772', '20001166162896', '20001166162865', '20001166161841', '20001166161092', '20001166160053', '20001166158909', '20001166158871', '20001166158315', '20001166157724', '20001166157125', '20001166156977', '20001166156322', '20001166155419', '20001166154918', '20001166153708', '20001166153685', '20001166152846', '20001166152450', '20001166151002', '20001166151091', '20001166150553', '20001166150452', '20001166150514', '20001166149288', '20001166148552', '20001166148180', '20001166148071', '20001166146064', '20001166145015', '20001166144822', '20001166144219', '20001166143816', '20001166143079', '20001166141188', '20001166140734', '20001166140147', '20001166138861', '20001166139721', '20001166138828', '20001166138432', '20001166137690', '20001166136727', '20001166136663', '20001166135283', '20001166134749', '20001166133779', '20001166133282', '20001166132598', '20001166131159', '20001166131124', '20001166129910', '20001166128797', '20001166127800', '20001166127768', '20001166126826', '20001166125385', '20001166124333', '20001166123400', '20001166123362', '20001166122164', '20001166120866', '20001166119828', '20001166118038', '20001166118275', '20001166117054', '20001166115659', '20001166116155', '20001166116129', '20001166114201', '20001166113104', '20001166112556', '20001166113067', '20001166112341', '20001166112526', '20001166111195', '20001166111067', '20001166110258', '20001166110224', '20001166109865', '20001166109618', '20001166108668', '20001166108520', '20001166107572', '20001166107034', '20001166106986', '20001166104838', '20001166104703', '20001166104670', '20001166103835', '20001166103620', '20001166102739', '20001166101598', '20001166101257', '20001166101567', '20001166100596', '20001166099852', '20001166100076', '20001166098659', '20001166098825', '20001166098630', '20001166098178', '20001166097582', '20001166096470', '20001166096143', '20001166095005', '20001166095398', '20001166094458', '20001166094417', '20001166094166', '20001166093087', '20001166092205', '20001166091750', '20001166090908', '20001166090409', '20001166090872', '20001166090038', '20001166090366', '20001166087859', '20001166087788', '20001166087156', '20001166086600', '20001166085981', '20001166085859', '20001166084687', '20001166083442', '20001166073794', '20001166072031', '20001166070105', '20001166070067', '20001166068074', '20001166065694', '20001166064996', '20001166063987', '20001166063820', '20001166062822', '20001166062976', '20001166061791', '20001166061722', '20001166060684', '20001166059151', '20001166059481', '20001166059117', '20001166058274', '20001166057768', '20001166057089', '20001166057064', '20001166056526', '20001166055931', '20001166055914', '20001166055179', '20001166054787', '20001166054336', '20001166054762', '20001166053383', '20001166051640', '20001166044431', '20001166043869', '20001166042870', '20001166041100', '20001166040577', '20001166041079', '20001166038702', '20001166038670', '20001166036296', '20001166036279', '20001166035260', '20001166035238', '20001166034458', '20001166034434', '20001166029854', '20001166029835', '20001166028898', '20001166028875', '20001166027939', '20001166027912', '20001166026007', '20001166025985', '20001166024952', '20001166024919', '20001166023539', '20001166023517', '20001166018557', '20001166017733', '20001166009024', '20001166007031', '20001166006033', '20001166005234', '20001166004014', '20001166000536', '20001166000714', '20001165998160', '20001165999520', '20001165998154', '20001165998139', '20001165998127', '20001165997047', '20001165996910', '20001165996895', '20001165997016', '20001165996882', '20001165995797', '20001165995781', '20001165995577', '20001165994584', '20001165994194', '20001165994571', '20001165992560', '20001165992542', '20001165992531', '20001165992187', '20001165992512', '20001165991185', '20001165990895', '20001165990328', '20001165989574', '20001165988488', '20001165987354', '20001165987340', '20001165987320', '20001165986460', '20001165985697', '20001165985682', '20001165985578', '20001165985672', '20001165985662', '20001165984040', '20001165984374', '20001165984021', '20001165982207', '20001165982709', '20001165982187', '20001165981559', '20001165982168', '20001165981516', '20001165981042', '20001165979895', '20001165979425', '20001165977954', '20001165978914', '20001165977928', '20001165977865', '20001165976557', '20001165976541', '20001165976684', '20001165976530', '20001165976518', '20001165975337', '20001165975099', '20001165975084', '20001165974742', '20001165974356', '20001165974313', '20001165973048', '20001165972699', '20001165972682', '20001165972664', '20001165970335', '20001165970319', '20001165968952', '20001165968937', '20001165968917', '20001165968099', '20001165966995', '20001165966979', '20001165966965', '20001165965588', '20001165965574', '20001165964303', '20001165964291', '20001165964273', '20001165963110', '20001165963077', '20001165963064', '20001165961405', '20001165961398', '20001165961363', '20001165959204', '20001165959186', '20001165959178', '20001165959166', '20001165957991', '20001165957978', '20001165011052', '20001165011032', '20001165011016', '20001165009045', '20001165009025', '20001165007251', '20001165007215', '20001165004994', '20001165004972', '20001165003741', '20001165001798', '20001165001766', '20001165001136', '20001165000200', '20001164998900', '20001165000183', '20001164998883', '20001164997850', '20001164995409', '20001164995393', '20001164995378', '20001164995369', '20001164992410', '20001164992388', '20001164993915', '20001164992372', '20001164991585', '20001164987889', '20001164987694', '20001164987868', '20001164985909', '20001164984702', '20001164985888', '20001164984687', '20001164982255', '20001164984663', '20001164982222', '20001164980689', '20001164980248', '20001164980672', '20001164978109', '20001164980218', '20001164978987', '20001164978081', '20001164977460', '20001164977425', '20001164968368', '20001164966528', '20001164950264', '20001164918988', '20001164918970', '20001164916882', '20001164915750', '20001164914310', '20001164914272', '20001164910837', '20001164908250', '20001164908226', '20001164906731', '20001164905480', '20001164903443', '20001164898495', '20001164898467', '20001164896566', '20001164895238', '20001164893593', '20001164891000', '20001164890962', '20001164885009', '20001164884009', '20001164882847', '20001164882816', '20001164879502', '20001164879469', '20001164876384', '20001164875223', '20001164873496', '20001164872352', '20001164872318', '20001164867425', '20001164865299', '20001164863907', '20001164862075', '20001164858590', '20001164856210', '20001164856171', '20001164854195', '20001164854178', '20001164850804', '20001164850762', '20001164847215', '20001164843230', '20001164838255', '20001164838226', '20001164836547', '20001164831804', '20001164827793', '20001164824965');
