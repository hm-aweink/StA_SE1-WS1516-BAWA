﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bll
{
    internal class clsCouponCollection : clsBLLCollections
    {
        string _databaseFile; // String zur Access-Datei
        DAL.DALObjects.dDataProvider _myDAL; // DAL: Zugriff auf die Datenbank

        internal clsCouponCollection()
        {
            _databaseFile = System.Configuration.ConfigurationManager.AppSettings["AccessFileName"];
            _myDAL = DAL.DataFactory.GetAccessDBProvider(_databaseFile);
        }

        internal List<clsCoupon> GetAllActiveCouponsByUser(int _uid)
        {
            _myDAL.AddParam("UID", _uid, DAL.DataDefinition.enumerators.SQLDataType.INT);
            DataSet _myDataSet = _myDAL.GetStoredProcedureDSResult("QCUGetAllActiveCouponsByUser");
            DataTable _myDataTable = _myDataSet.Tables[0];

            List<clsCoupon> _myCouponList = new List<clsCoupon>();

            foreach (DataRow _dr in _myDataTable.Rows)
            {
                clsCoupon _myCoupon = DataRowToClsCoupon(_dr);
                _myCouponList.Add(_myCoupon);
            }

            return _myCouponList;
        }

        internal int InsertCoupon(clsCoupon _myCoupon)
        {
            _myDAL.AddParam("Code", _myCoupon.Code, DAL.DataDefinition.enumerators.SQLDataType.VARCHAR);
            _myDAL.AddParam("Discount", _myCoupon.Discount, DAL.DataDefinition.enumerators.SQLDataType.INT);
            _myDAL.AddParam("IsActive", _myCoupon.IsValid, DAL.DataDefinition.enumerators.SQLDataType.BOOL);
            _myDAL.AddParam("FKUserId", _myCoupon.Uid, DAL.DataDefinition.enumerators.SQLDataType.INT);

            int _affectedRows = -1;

            try
            {
                _affectedRows =  _myDAL.MakeStoredProcedureAction("QCInsertCoupon");
            }
            catch (Exception)
            {
                
            }

            return _affectedRows;
        }

        internal List<clsCoupon> GetAllCoupons()
        {
            DataSet _myDataSet = _myDAL.GetStoredProcedureDSResult("QCUGetAllCoupons");
            DataTable _myDataTable = _myDataSet.Tables[0];
            List<clsCoupon> _myCouponList = new List<clsCoupon>();

            foreach (DataRow _dr in _myDataTable.Rows)
            {
                clsCoupon _myCoupon = DataRowToClsCoupon(_dr);
                _myCouponList.Add(_myCoupon);
            }

            return _myCouponList;
        }

        internal clsCoupon GetCouponById(int _cuid)
        {
            _myDAL.AddParam("Id", _cuid, DAL.DataDefinition.enumerators.SQLDataType.INT);
            DataSet _myDataSet = _myDAL.GetStoredProcedureDSResult("QCUGetCouponById");
            DataTable _myDataTable = _myDataSet.Tables[0];
            clsCoupon _myCoupon = DataRowToClsCoupon(_myDataTable.Rows[0]);

            return _myCoupon;
        }

        internal int ToggleCoupon(int _cuid)
        {
            _myDAL.AddParam("ID", _cuid, DAL.DataDefinition.enumerators.SQLDataType.INT);

            int _affectedRows = _myDAL.MakeStoredProcedureAction("QCUToggleCoupon");
            return _affectedRows;
        }

        internal Dictionary<int,String> GetAllUsersForCoupons()
        {
            DataSet _myDataSet = _myDAL.GetStoredProcedureDSResult("QCUGetAllUsers");
            DataTable _myDataTable = _myDataSet.Tables[0];

            Dictionary<int, String> _myUserDictionary = new Dictionary<int, string>();

            foreach (DataRow _dr in _myDataTable.Rows)
            {
                int _key = AddIntFieldValue(_dr, "UID");
                String _value = AddStringFieldValue(_dr, "Fullname");
                _myUserDictionary.Add(_key, _value);
            }

            return _myUserDictionary;
        }

        internal clsCoupon DataRowToClsCoupon(DataRow _dr)
        {
            clsCoupon _myCoupon = new clsCoupon();
            _myCoupon.Id = AddIntFieldValue(_dr, "CUID");
            _myCoupon.Code = AddStringFieldValue(_dr, "CUCode");
            _myCoupon.Discount = AddIntFieldValue(_dr, "CUDiscount");
            _myCoupon.IsValid = AddBoolFieldValue(_dr, "CUIsActive");
            _myCoupon.Uid = AddIntFieldValue(_dr, "UID");
            _myCoupon.UserName = AddStringFieldValue(_dr, "UEmail");
            return _myCoupon;
        }

    }
}