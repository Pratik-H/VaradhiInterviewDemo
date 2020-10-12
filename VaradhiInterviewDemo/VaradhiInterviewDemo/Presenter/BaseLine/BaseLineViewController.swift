//
//  BaseLineViewController.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class BaseLineViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - Parameter
    @objc dynamic var monthlyAppointmentsData: [MonthlyAppointmentsData]?
    var monthlyAppointmentsDataObserver: NSKeyValueObservation?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    
    private func fetchData() {
        guard let model = convertModelToJSON(model: MonthlyAppointmentParameters()) else {return}
        let api: VS_API_Router = .get_monthly_appointments(model)
        VS_API_Client.getData(ofURL: api) { [weak self] result in
            print(result)
            switch result {
                case .success(let appointmentData):
                    do {
                        let decoder = JSONDecoder()
                        decoder.dataDecodingStrategy = .base64
                        let object = try decoder.decode(MonthlyAppointmentSuccess.self, from: appointmentData) as? MonthlyAppointmentSuccess
                        self?.setValue(object?.unassigned, forKey: "monthlyAppointmentsData")
                    } catch {
                        print(error)
                }
                case .failure(let error):
                    print(error)
            }
        }
        
        monthlyAppointmentsDataObserver = observe(\.monthlyAppointmentsData, changeHandler: { (value, object) in
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    deinit {
        monthlyAppointmentsDataObserver?.invalidate()
    }

}


extension BaseLineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthlyAppointmentsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseLineMontlyAppointmentTableViewCell") as? BaseLineMontlyAppointmentTableViewCell, let data =  monthlyAppointmentsData?[indexPath.row] else
        {return UITableViewCell()}
        cell.configureCell(monthlyAppointmentsData: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(identifier: "AppointmentMapViewController") as? AppointmentMapViewController else {return}
        viewController.monthlyAppointmentsData = monthlyAppointmentsData?[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

