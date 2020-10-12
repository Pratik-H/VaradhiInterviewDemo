//
//  BaseLineMontlyAppointmentTableViewCell.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class BaseLineMontlyAppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var instituteNameLabel: UILabel!

    @IBOutlet weak var pocNameLabel: UILabel!
    
    @IBOutlet weak var employeeIDLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCell(monthlyAppointmentsData: MonthlyAppointmentsData) {
        instituteNameLabel.text = monthlyAppointmentsData.institutionName
        pocNameLabel.text = monthlyAppointmentsData.pocName
        employeeIDLabel.text = monthlyAppointmentsData.marketingUserEmployeeID
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        instituteNameLabel.text = ""
        pocNameLabel.text = ""
        employeeIDLabel.text = ""
    }
}
