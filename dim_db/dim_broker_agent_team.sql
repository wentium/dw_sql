insert overwrite table dim_db.dim_broker_agent_team
select
x.user_id as broker_id,
x.name as broker_name,
a.team_id,
a.team_name,
a.agent_id,
a.agent_name,
a.company_id,
a.company_name,
a.team_community_cnt,
a.team_bambooplate_cnt,
a.team_lng,
a.team_lat,
a.agent_community_cnt,
a.agent_bambooplate_cnt,
a.agent_lng,
a.agent_lat,
x.city_id,
x.sex,
x.service_year,
x.engage_block_ids,
x.avatar,
x.wechat_name,
x.created_at,
x.updated_at,
x.identity_card_number,
x.identity_card_photo,
x.identity_card_photo_back,
x.store_id,
x.has_leader_ability,
x.on_duty_date,
x.assessment_start_date,
x.qq,
x.status,
case when x.status='1' then '待入职' when x.status='2' then '在职' when x.status='3' then '取消入职' when x.status='4' then '离职' end as status_name,
x.employee_id,
x.mail,
x.serving_start_date,
x.join_year,
x.avatar_small,
x.good_business_ids,
x.familiar_community_ids,
x.life_image_ids,
x.work_experience,
x.label_id,
x.cover_life_image_id,
x.type,
x.is_gold_medal,
x.cooperate_status,
x.the_business_license_id,
x.the_tax_certificate_id,
x.organization_code_id
from
db_sync.angejia__broker x
inner join db_sync.property__agent_team_broker m on x.user_id=m.user_id and m.deleted_at is null
inner join dim_db.dim_agent_team a on m.team_id=a.team_id
;
