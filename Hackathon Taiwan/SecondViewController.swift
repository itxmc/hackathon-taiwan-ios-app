//
//  SecondViewController.swift
//  Hackathon Taiwan
//
//  Created by Yi-Hsun Chou on 11/15/15.
//  Copyright © 2015 Yi-Hsun Chou. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController {
    

@IBOutlet weak var mapView: MKMapView!
    var mainMapView: MKMapView!
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //使用代码创建
        self.mainMapView = MKMapView(frame:self.view.frame)
        self.view.addSubview(self.mainMapView)
        
        //地图类型设置 - 标准地图
        self.mainMapView.mapType = MKMapType.Standard
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        var latDelta = 0.004
        var longDelta = 0.004
        var currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        //var center:CLLocation = locationManager.location.coordinate
        //使用自定义位置
        var center:CLLocation = CLLocation(latitude: 25.072236, longitude: 121.5179598)
        var currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
            span: currentLocationSpan)
        
        //设置显示区域
        self.mainMapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        var objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 25.072236, longitude: 121.5179598).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "Hackathon Taiwan 主場"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "Address: 台北市大同區承德路三段232號B2"
        //添加大头针
        self.mainMapView.addAnnotation(objectAnnotation)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

