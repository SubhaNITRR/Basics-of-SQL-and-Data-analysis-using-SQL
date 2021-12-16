SELECT count( *) FROM house.`nashville housing data for data cleaning` as nashville;
select * from house.`nashville housing data for data cleaning`;


--converting to proper date format


select * from house.`nashville housing data for data cleaning` where PropertyAddress is null;
select SaleDate from house.`nashville housing data for data cleaning`;
alter table house.`nashville housing data for data cleaning` 
add column SaleDateConverted date; 
describe house.`nashville housing data for data cleaning`
select SaleDate,convert(SaleDate,DateTIME) as Converted_SaleDate_Time from house.`nashville housing data for data cleaning`;
update house.`nashville housing data for data cleaning`
set SaleDateConverted=convert(date,SaleDate);

--Replacig Null values

select PropertyAddress from house.`nashville housing data for data cleaning` where PropertyAddress is null;
select ParcelID,PropertyAddress from house.`nashville housing data for data cleaning`;
select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress from house.`nashville housing data for data cleaning` a inner join house.`nashville housing data for data cleaning` b 
on a.ParcelID=b.ParcelID and a.UniqueID <> b.UniqueID 
where a.PropertyAddress is null;
update a
set PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
from house.`nashville housing data for data cleaning` a 
join
house.`nashville housing data for data cleaning` b
on a.ParcelID=b.ParcelID
and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null;

--spliting of propertyaddress


select PropertyAddress from house.`nashville housing data for data cleaning`;
select substring(PropertyAddress,1,position(',' in  PropertyAddress) -1 ) as split_street_address,
 substring(PropertyAddress,position(',' in PropertyAddress)+1,char_length(PropertyAddress)) as split_city_address
 from house.`nashville housing data for data cleaning` ;
 alter table house.`nashville housing data for data cleaning`
 add column split_street_address varchar(60);
 alter table house.`nashville housing data for data cleaning`
 add column split_city_address varchar(50);
 update house.`nashville housing data for data cleaning`
 set split_street_address=substring(PropertyAddress,1,position(',' in PropertyAddress)-1);
 update house.`nashville housing data for data cleaning`
 set split_city_address=substring(PropertyAddress,position(',' in PropertyAddress)+1,char_length(PropertyAddress));
 
 --OwnerAddressSpliting
 use house;
 
 select OwnerAddress from house.`nashville housing data for data cleaning`;
 select parsename(repalce(OwnerAddress,',','.'),3),
        parsename(repalce(OwnerAddress,',','.'),2),
        parsename(repalce(OwnerAddress,',','.'),1)
        from house.`nashville housing data for data cleaning`;
alter table house.`nashville housing data for data cleaning`
add column split_street_address varchar(50);
alter table house.`nashville housing data for data cleaning`
add column split_street_city varchar(50);
alter table house.`nashville housing data for data cleaning`
add column split_street_state varchar(50);
update house.`nashville housing data for data cleaning`
set split_street_address= parsename(repalce(OwnerAddress,',','.'),3);
update house.`nashville housing data for data cleaning`
set split_street_city= parsename(repalce(OwnerAddress,',','.'),2);
update house.`nashville housing data for data cleaning`
set split_street_state= parsename(repalce(OwnerAddress,',','.'),1);
select * from house.`nashville housing data for data cleaning`;

select distinct(SoldAsVacant),count(SoldAsVacant)
from house.`nashville housing data for data cleaning`
group by SoldAsVacant
order by 2;
select SoldAsVacant,case when SoldAsVacant='Y' then 'Yes'
                         when SoldAsVacant='N' then 'No'
                         else SoldAsVacant
                     end as new_SoldAsVacant
from house.`nashville housing data for data cleaning`;
update house.`nashville housing data for data cleaning`
set SoldAsVacant=case when SoldAsVacant='Y' then 'Yes'
					  when SoldAsVacant='N' then 'No'
                      else SoldAsVacant
                 end;
                                  