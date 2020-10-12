//
//  MonthlyAppointments.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation

// MARK: - MonthlyAppointments
@objc class MonthlyAppointmentSuccess: NSObject, Codable {
    let status: String?
    let unassigned: [MonthlyAppointmentsData]?
    let message: String?
    let statusCode: Int?
    let assigned: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case status, unassigned, message
        case statusCode = "status_code"
        case assigned
    }
    
    init(status: String?, unassigned: [MonthlyAppointmentsData]?, message: String?, statusCode: Int?, assigned: [JSONAny]?) {
        self.status = status
        self.unassigned = unassigned
        self.message = message
        self.statusCode = statusCode
        self.assigned = assigned
    }
}

// MARK: - MonthlyAppointmentsData
@objc class MonthlyAppointmentsData: NSObject, Codable {
    let pocEmail, message, addressLine2, addressLine1: String?
    let customAppointmentID, city, pocDesignation, marketingUserFirstname: String?
    let appointmentTime, appointmentID, marketingUserEmployeeID, imageAddress: String?
    let state, institutionName, institutionStatus, institutionEmail: String?
    let imageSelectionView, marketingUserID: String?
    let institutionExtentionNumber: Int?
    let landMark, site: String?
    let pocPhoneNumber, institutionSTDCode: Int?
    let marketingUserPicture, marketingUserLastname, appointmentDate, updatedDatetime: String?
    let marketingUserMobileNumber, institutionLandlineNumber: Int?
    let addedDatetime: String?
    let pin: Int?
    let appointmentStatus, pocName: String?
    
    enum CodingKeys: String, CodingKey {
        case pocEmail = "POC_Email"
        case message
        case addressLine2 = "Address_Line_2"
        case addressLine1 = "Address_Line_1"
        case customAppointmentID = "custom_appointment_id"
        case city = "City"
        case pocDesignation = "POC_Designation"
        case marketingUserFirstname = "marketing_user_firstname"
        case appointmentTime = "appointment_time"
        case appointmentID = "appointment_id"
        case marketingUserEmployeeID = "marketing_user_employee_id"
        case imageAddress = "image_address"
        case state = "State"
        case institutionName = "Institution_Name"
        case institutionStatus = "Institution_Status"
        case institutionEmail = "Institution_Email"
        case imageSelectionView = "Image_Selection_View"
        case marketingUserID = "marketing_user_id"
        case institutionExtentionNumber = "Institution_Extention_Number"
        case landMark = "Land_Mark"
        case site
        case pocPhoneNumber = "POC_Phone_Number"
        case institutionSTDCode = "Institution_STD_Code"
        case marketingUserPicture = "marketing_user_picture"
        case marketingUserLastname = "marketing_user_lastname"
        case appointmentDate = "appointment_date"
        case updatedDatetime = "updated_datetime"
        case marketingUserMobileNumber = "marketing_user_mobile_number"
        case institutionLandlineNumber = "Institution_Landline_Number"
        case addedDatetime = "added_datetime"
        case pin = "PIN"
        case appointmentStatus = "appointment_status"
        case pocName = "POC_Name"
    }
    
    init(pocEmail: String?, message: String?, addressLine2: String?, addressLine1: String?, customAppointmentID: String?, city: String?, pocDesignation: String?, marketingUserFirstname: String?, appointmentTime: String?, appointmentID: String?, marketingUserEmployeeID: String?, imageAddress: String?, state: String?, institutionName: String?, institutionStatus: String?, institutionEmail: String?, imageSelectionView: String?, marketingUserID: String?, institutionExtentionNumber: Int?, landMark: String?, site: String?, pocPhoneNumber: Int?, institutionSTDCode: Int?, marketingUserPicture: String?, marketingUserLastname: String?, appointmentDate: String?, updatedDatetime: String?, marketingUserMobileNumber: Int?, institutionLandlineNumber: Int?, addedDatetime: String?, pin: Int?, appointmentStatus: String?, pocName: String?) {
        self.pocEmail = pocEmail
        self.message = message
        self.addressLine2 = addressLine2
        self.addressLine1 = addressLine1
        self.customAppointmentID = customAppointmentID
        self.city = city
        self.pocDesignation = pocDesignation
        self.marketingUserFirstname = marketingUserFirstname
        self.appointmentTime = appointmentTime
        self.appointmentID = appointmentID
        self.marketingUserEmployeeID = marketingUserEmployeeID
        self.imageAddress = imageAddress
        self.state = state
        self.institutionName = institutionName
        self.institutionStatus = institutionStatus
        self.institutionEmail = institutionEmail
        self.imageSelectionView = imageSelectionView
        self.marketingUserID = marketingUserID
        self.institutionExtentionNumber = institutionExtentionNumber
        self.landMark = landMark
        self.site = site
        self.pocPhoneNumber = pocPhoneNumber
        self.institutionSTDCode = institutionSTDCode
        self.marketingUserPicture = marketingUserPicture
        self.marketingUserLastname = marketingUserLastname
        self.appointmentDate = appointmentDate
        self.updatedDatetime = updatedDatetime
        self.marketingUserMobileNumber = marketingUserMobileNumber
        self.institutionLandlineNumber = institutionLandlineNumber
        self.addedDatetime = addedDatetime
        self.pin = pin
        self.appointmentStatus = appointmentStatus
        self.pocName = pocName
    }
}
