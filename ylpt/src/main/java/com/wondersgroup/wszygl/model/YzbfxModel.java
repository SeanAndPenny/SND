package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class YzbfxModel implements BaseEntity {
          private String yljgdm;
          private String yljgmc;
          private String mzypfy;
          private String mzqtfy;
          private String zyypfy;
          private String zyqtfy;
          private String rq;
          
		public String getMzqtfy() {
			return mzqtfy;
		}
		public void setMzqtfy(String mzqtfy) {
			this.mzqtfy = mzqtfy;
		}
		public String getZyypfy() {
			return zyypfy;
		}
		public void setZyypfy(String zyypfy) {
			this.zyypfy = zyypfy;
		}
		public String getYljgdm() {
			return yljgdm;
		}
		public void setYljgdm(String yljgdm) {
			this.yljgdm = yljgdm;
		}
		public String getYljgmc() {
			return yljgmc;
		}
		public void setYljgmc(String yljgmc) {
			this.yljgmc = yljgmc;
		}
		public String getMzypfy() {
			return mzypfy;
		}
		public void setMzypfy(String mzypfy) {
			this.mzypfy = mzypfy;
		}
		public String getZyqtfy() {
			return zyqtfy;
		}
		public void setZyqtfy(String zyqtfy) {
			this.zyqtfy = zyqtfy;
		}
		public String getRq() {
			return rq;
		}
		public void setRq(String rq) {
			this.rq = rq;
		}
		@Override
		public String toString() {
			return "YzbfxModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", mzypfy=" + mzypfy + ", mzqtfy=" + mzqtfy
					+ ", zyypfy=" + zyypfy + ", zyqtfy=" + zyqtfy + ", rq=" + rq + "]";
		}
          
}
