create table donor(
					donor_id int primary key,
                    first_name varchar(20) not null, last_name varchar(20),
                    email varchar(30) not null,
                    phone_no int);

create table department(
						department_id int primary key,
                        name varchar(50) not null
						);

create table drive(
					drive_id int primary key,
                    name varchar(50) not null
					);
                    

                    
create table donation(
						donation_id int primary key,
                        donor_id int not null,
                        amount int not null,
                        department_id int,
                        drive_id int,
						constraint donation_fk_donorid
                        foreign key(donor_id) references donor(donor_id)
                        on delete cascade
                        on update cascade);

create table subscriber(
						subscription_id int primary key,
                        donor_id int not null,
                        subscription_date date not null,
						constraint subscriber_fk_donorid
                        foreign key(donor_id) references donor(donor_id)
                        on delete cascade
                        on update cascade);
                        
create table staff(
					staff_id int primary key,
                    role varchar(20) not null,
                    salary float
					);
                    
create table post(
				 post_id int primary key,
                 author_id int not null,
                 title varchar(100) not null,
                 date_of_posting date not null,
				 constraint post_fk_authorid
                 foreign key(author_id) references staff(staff_id)
                 on delete cascade
                 on update cascade);


create table active_drive(
						active_drive_id int primary key,
                        drive_id int not null,
                        total_funds_collected int not null,
                        starting_date date,
						constraint active_drive_fk_donorid
                        foreign key(drive_id) references drive(drive_id)
                        on delete cascade
                        on update cascade);
                        
create table past_drive(
						log_id int primary key,
                        active_drive_id int not null,
                        ending_date date not null,
						constraint pastdrive_fk_activedriveid
                        foreign key(active_drive_id) references active_drive(active_drive_id)
                        on delete cascade
                        on update cascade);


                        
create table inventory(
						inventory_id int primary key,
                        donation_id int not null,
                        name varchar(100) not null,
                        count int not null,
                        constraint inventory_fk_donationid
                        foreign key(donation_id) references donation(donation_id)
                        on delete cascade
                        on update cascade);

create table beneficiary(
						beneficiary_id int primary key,
                        dept_id int not null,
                        first_name varchar(20) not null,
                        last_name varchar(20),
                        gender varchar(20),
                        age int,
						constraint beneficiary_fk_deptid
                        foreign key(dept_id) references department(department_id)
                        on delete cascade
                        on update cascade);
                        
create table blood_donation(
donor_id int, blood_type varchar(20),
constraint blooddonation_fk_donorid
foreign key (donor_id) references donor(donor_id) on delete cascade on update cascade);

create table blood_bank (blood_type varchar (20),units int);

create table dispensary(
						disp_id int primary key,
                        Medicine varchar(30) not null,
                        Category varchar(50) not null,
                        Expiry date not null);

create table ambulance(
						plate_no int primary key,
                        driver_id int,
                        constraint ambulance_fk_driver
                        foreign key(driver_id) references staff(staff_id)
                        on delete cascade 
                        on update cascade);
                        
create table volunteer(
						volunteer_id int primary key,
                        first_name varchar(30) not null,
                        last_name varchar(30) not null,
                        age int,
                        joining_date date not null);
