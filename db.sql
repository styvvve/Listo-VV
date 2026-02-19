--tables creation

CREATE TABLE List (
  list_id uuid default uuid_generate_v4(),
  title text,
  create_at timestamp with time zone default now() not null,
  created_by uuid,
  constraint pk_List primary key (list_id)
);

CREATE TABLE Profiles (
  user_id uuid references auth.users(id) on delete cascade,
  email text,
  first_name text,
  last_name text,
  created_at timestamp with time zone default now() not null,
  constraint pk_Profiles primary key (user_id)
);

CREATE TABLE Items (
  item_id uuid default uuid_generate_v4(),
  title text,
  completed_at timestamp,
  completed_by uuid,
  list_id uuid,
  constraint pk_Items primary key (item_id),
  constraint fk_Items_Profiles foreign key (completed_by) references Profiles(user_id),
  constraint fk_Items_List foreign key (list_id) references List(list_id)
);

CREATE TABLE List_members (
  list_id uuid not null,
  user_id uuid not null,
  role varchar(20) not null,
  constraint pk_ListMembers primary key (list_id, user_id),
  constraint fk_ListMembers_List foreign key (list_id) references List (list_id),
  constraint fk_ListMembers_Profiles foreign key (user_id) references Profiles (user_id),
  constraint ck_ListMembers_role check (role in ('owner', 'member'))
);
