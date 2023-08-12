package com.tjoeun.vo;

public class MeetingVO {


	    private int room_Id;
	    private String user_Name;
	    private String meetingDate;
	    private String meetingTime;
	    private String status;
		public int getRoom_Id() {
			return room_Id;
		}
		public void setRoom_Id(int room_Id) {
			this.room_Id = room_Id;
		}
		public String getUser_Name() {
			return user_Name;
		}
		public void setUser_Name(String user_Name) {
			this.user_Name = user_Name;
		}
		public String getMeetingDate() {
			return meetingDate;
		}
		public void setMeetingDate(String meetingDate) {
			this.meetingDate = meetingDate;
		}
		public String getMeetingTime() {
			return meetingTime;
		}
		public void setMeetingTime(String meetingTime) {
			this.meetingTime = meetingTime;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		@Override
		public String toString() {
			return "MeetingVO [room_Id=" + room_Id + ", user_Name=" + user_Name
					+ ", meetingDate=" + meetingDate + ", meetingTime=" + meetingTime + ", status=" + status + "]";
		}
		
}
