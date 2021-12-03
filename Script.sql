create table if not exists Collection (
	id serial primary key,
	collection_name varchar(40) not null,
	release integer
);

create table if not exists Album (
	id serial primary key,
	album_name varchar(50) not null
);

create table if not exists Author (
	id serial primary key,
	author_name varchar(40) not null
);

create table if not exists Genre (
	id serial primary key,
	genre_name varchar(30) not null
);

create table if not exists Track (
	id serial primary key,
	album_id integer references Album(id),
	track_name varchar(50) not null,
	track_time numeric(3, 1)
);

create table if not exists TrackCollection (
	id serial primary key,
	track_id integer not null references Track(id),
	collection_id integer not null references Collection(id)
);

create table if not exists AuthorAlbum (
	id serial primary key,
	author_id integer not null references Author(id),
	album_id integer not null references Album(id)
);

create table if not exists AuthorGenre (
	id serial primary key,
	author_id integer not null references Author(id),
	genre_id integer not null references Genre(id)
);