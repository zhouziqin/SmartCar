
在sso库中查询商户信息

select * from `db_sso`.`t_sys_merchant` where merchant_id = 3688104;

在sso库中查询用户信息

select * from `db_sso`.`t_sys_user` where mobile = '16812345678';

得到sso_id为 117453





insert into `ads`.`customer_user`
(`id`,`customer_id`,`sso_id`,`admin_flag`,
`mobile`,`remarks`,`status`, `reserve_1`,`reserve_2`,`create_id`,
`update_id`,`create_name`, `update_name`,`create_time`,`update_time`
)
values
(
null,3688104,117453,1,
16812345678,null,0,null,null,null,
null,null,null,now(),now()
);


比如上面插入的数据的id为 X，下面插入的时候需要。
select id from `ads`.`customer_user` where customer_id = 3688104 and sso_id = 117453


insert into `ads`.`customer_user_role`
(`id`,`user_id`,`customer_id`,`sso_id`,`role_code`,
`remarks`,`status`,`reserve_1`,`reserve_2`,`create_id`,
`update_id`,`create_name`,`update_name`,`create_time`,`update_time`
)
values
(
null,X-上面得到,3688104,117453,'ADS_ADMIN',
null,0,null,null,null,
null,null,null,now(),now()
);




