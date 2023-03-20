create table entry2(
	entry_id serial primary key,
	device_type varchar(50) not null,
	stats_access_link varchar(500) not null,
	regulated varchar(500)
); -- Table is created to try. I also add one more column to stroe data while processing.

INSERT INTO entry2 (device_type, stats_access_link)
VALUES
  ('AXO145', '<url>https://xcd.321112.smart_meter.com</url>'),
  ('TRU151', '<url>http://xcd.321113.smart_meter.com</url>'),
  ('ZOD231', '<url>https://xcd.321114.smart_meter.com</url>'),
  ('YRT326', '<url>https://xcd.321115.smart_meter.com</url>'),
  ('LWR245', '<url>http://xcd.321116.smart_meter.com</url>');-- fake data is generated.
  
UPDATE entry2 SET stats_access_link = LOWER(stats_access_link);-- By using update command we convert everything lowercase since it is desired
update entry2 set regulated = substring(stats_access_link from '://([^/]*)</');-- By using substring method I get the string between :// and / to satisfy the second rule.
															-- I saved them on regulated column which I created to save data by using update instruction
select device_type, regulated from entry2;-- I get the results.