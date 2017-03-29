#Data Wrangling Exercise 1: 

#Setup
refine_1 <- data.frame(refine_original2)
names(refine_1) <- c("Company", "Product Code & Number", "Address", "City", "Country", "Name")

#Clean up brand names
refine_1$Company <- gsub("^[Pp].*|^[Ff].*", "philips", refine_1$Company)
refine_1$Company <- gsub("^[Aa].*", "akzo", refine_1$Company)
refine_1$Company <- gsub("^[Vv].*", "van houten", refine_1$Company)
refine_1$Company <- gsub("^[Uu].*", "unilever", refine_1$Company)

#Separate product code and number
refine_2 <- separate(refine_1, "Product Code_Number", 
         c("product_code", "product_number"), sep = "-")

#Add product categories
refine_3 <- mutate(refine_2, product_category = ifelse(product_code %in% "p", "Smartphone",
                                           ifelse(product_code %in% "v", "TV",
                                              ifelse(product_code %in% "x", "Laptop",
#Add full address for geocoding                      ifelse(product_code %in% "q", "Tablet", NA)))))
refine_3 <- unite(refine_3, "full_address", Address, City, Country, sep = ",")

#Create dummy variables for company and product category
refine_4 <- mutate(refine_3, Company2 = Company)

refine_4 <- refine_4 %>%
  mutate(Company2 = paste0("company_", Company2), yesno = 1) %>%
  spread(Company2, yesno, fill = 0)

refine_4 <- mutate(refine_4, product_category2 = product_category)






