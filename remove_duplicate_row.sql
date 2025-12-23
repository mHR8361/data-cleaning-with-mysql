select * from layoffs
;
create table layoffs_staging
like layoffs
;
alter table layoffs_staging add column row_num int
;
insert layoffs_staging
select * ,row_number() over(partition by company , location , industry , total_laid_off , percentage_laid_off , `date` , stage , country , funds_raised_millions ) as row_num
from layoffs
;
delete from layoffs_staging
where row_num > 1
;


select *
from layoffs_staging
;

create table total_layoffs
like layoffs;

insert total_layoffs
select company , location , industry , total_laid_off , percentage_laid_off , `date` , stage , country , funds_raised_millions 
from layoffs_staging
;


