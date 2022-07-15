

--Data cleaning

SELECT *
FROM PortfolioProject.dbo.Nashville_Housing

-- Standartize Date Format

SELECT SaleDateConverted, CONVERT(Date, SaleDate)
FROM PortfolioProject.dbo.Nashville_Housing

-- Does not work for some reason
Update Nashville_Housing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE Nashville_Housing
ADD SaleDateConverted Date;

Update Nashville_Housing
SET SaleDateConverted = CONVERT(Date, SaleDate)

-- Populate Property Address Data

SELECT *
FROM PortfolioProject.dbo.Nashville_Housing
Order by ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,  b.PropertyAddress) 
FROM PortfolioProject.dbo.Nashville_Housing a
JOIN PortfolioProject.dbo.Nashville_Housing b
  on a.ParcelID = b.ParcelID
  AND a.[UniqueID ] <> b.[UniqueID ]
  WHERE a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,  b.PropertyAddress)
FROM PortfolioProject.dbo.Nashville_Housing a
JOIN PortfolioProject.dbo.Nashville_Housing b
  on a.ParcelID = b.ParcelID
  AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

-- Breaking out Address into Individual Columns (Adress, City, State)

SELECT PropertyAddress
FROM PortfolioProject.dbo.Nashville_Housing

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as Address

FROM PortfolioProject.dbo.Nashville_Housing

ALTER TABLE Nashville_Housing
ADD PropertySplitAddress Varchar(255);

Update Nashville_Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

ALTER TABLE Nashville_Housing
ADD PropertySplitCity Varchar(255);

Update Nashville_Housing
SET PropertySplitCity =  SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))


SELECT OwnerAddress
FROM PortfolioProject.dbo.Nashville_Housing

SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM PortfolioProject.dbo.Nashville_Housing

ALTER TABLE Nashville_Housing
ADD OwnerSplitState Varchar(255);

Update Nashville_Housing
SET OwnerSplitState =  PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

ALTER TABLE Nashville_Housing
ADD OwnerSplitCity Varchar(255);

Update Nashville_Housing
SET OwnerSplitCity =  PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE Nashville_Housing
ADD OwnerSplitAddress Varchar(255);

Update Nashville_Housing
SET OwnerSplitAddress =  PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

SELECT *
FROM PortfolioProject.dbo.Nashville_Housing

-- Change Y and N to Yes and NO in "Sold as Vacant" column

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject.dbo.Nashville_Housing
GROUP BY SoldAsVacant 
ORDER BY 2

SELECT SoldAsVacant,
CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
FROM PortfolioProject.dbo.Nashville_Housing

Update Nashville_Housing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END


-- Remove Duplicates

WITH RowNumCTE AS(
SELECT *,
   ROW_NUMBER() OVER(
   PARTITION BY ParcelID,
   PropertyAddress,
   SaleDate,
   LegalReference
   ORDER BY
   UniqueID
   ) row_num

FROM PortfolioProject.dbo.Nashville_Housing)
SELECT *
FROM RowNumCTE
WHERE row_num > 1

-- Delete Unused Columns

ALTER TABLE PortfolioProject.dbo.Nashville_Housing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate








