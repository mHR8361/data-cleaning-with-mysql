#######remove space#######
update total_layoffs
set company = trim(trailing "." from company)
;
update total_layoffs
set company = trim(company)
;

select distinct(industry)
from total_layoffs
order by industry

;
#####edit similar row/column#########
update total_layoffs
set industry = "Crypto"
where industry = "Crypto Currency" or industry = 'CryptoCurrency'
;


select distinct(country)
from total_layoffs
order by country
;



update total_layoffs
set country = trim(trailing "." from country)
;

select *
from total_layoffs
;

########## change datatype (str to date)############
update total_layoffs
set `date` = str_to_date(`date` ," %m/%d/%Y")
;

alter table total_layoffs
modify column `date` date
