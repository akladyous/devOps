
DROP TABLE IF EXISTS photo_comments CASCADE;
CREATE TABLE IF NOT EXISTS photo_comments (
	photo_id integer references photos(photo_id) ON DELETE SET NULL,
	comment_id integer references comments(comment_id) ON DELETE SET NULL,
	primary key (photo_id, comment_id)
);

INSERT INTO photo_comments 
	(photo_id, comment_id) 
	values
	(1,1);
	
select * from photo_comments;