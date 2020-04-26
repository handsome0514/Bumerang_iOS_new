//
//  AddCarVC.swift
//  bumerang
//
//  Created by RMS on 2019/9/10.
//  Copyright © 2019 RMS. All rights reserved.
//

import UIKit
import GDCheckbox
import Photos
import DKImagePickerController
import DKCamera
import SwiftyJSON
import SwiftyUserDefaults
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseDatabase



//var  uplodimgarray = [String]()

class AddItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageVWItem: UIImageView!
    
    
}

class AddCarVC: BaseViewController {
    var  uplodimgarray:[String] = []
    
    //outletsofbuttons
    @IBOutlet var addimg1: UIButton!
    @IBOutlet var addimg2: UIButton!
    @IBOutlet var addimg3: UIButton!
    @IBOutlet var addimg4: UIButton!
    @IBOutlet var addimg5: UIButton!
    @IBOutlet var addimg6: UIButton!
    
    
    //actions
    
    var image1 = true
     var image2 = true
     var image3 = true
     var image4 = true
     var image5 = true
     var image6 = true
    

    
    


     var image1postion = false
    var image2postion = false
    var image3postion = false
    var image4postion = false
    var image5postion = false
    var image6postion = false
    
    
    var selectedPeriod = 0
    var selectedFuel = ""
    var selectedGear = ""
    var selectedCarType = ""
    var depositState = ""
    var latitude : Double = 0
    var longitude : Double = 0
    
    
    @IBOutlet var imgcollectionview: UICollectionView!
    @IBOutlet var collctnVW_imagesToUplosd: UICollectionView!

    @IBOutlet weak var ui_titleTxt: UITextField!
    @IBOutlet weak var ui_fuelDropDown: DropDown!
    @IBOutlet weak var ui_gearDropDown: DropDown!
    @IBOutlet weak var ui_doorTxt: UITextField!
    @IBOutlet weak var ui_cartypeDropDown: DropDown!
    @IBOutlet weak var ui_depositDropDown: DropDown!
    
    @IBOutlet weak var ui_priceTxt: UITextField!
    @IBOutlet weak var ui_dayRadio: GDCheckbox!
    @IBOutlet weak var ui_weekRadio: GDCheckbox!
    @IBOutlet weak var ui_monthRadio: GDCheckbox!
    @IBOutlet weak var ui_descriptionTxtView: UITextView!
    @IBOutlet weak var ui_uploadImg: UIImageView!
    @IBOutlet weak var ui_addrLbl: UITextField!
    
    
    
    var oneProduct : ProductModels? = nil
    
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = self.collctnVW_imagesToUplosd?.collectionViewLayout as? UICollectionViewFlowLayout {
          flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        self.setClickableLabel()
//        ui_mapView.isZoomEnabled = true
        
        let fuelTypeOption = FuelTypeOption()
        ui_fuelDropDown.optionArray = fuelTypeOption.values_en
        ui_fuelDropDown.optionIds = fuelTypeOption.ids
        ui_fuelDropDown.checkMarkEnabled = false
        ui_fuelDropDown.didSelect{(selectedText , index , id) in
            self.selectedFuel = selectedText
        }
        
        let gearOption = GearOption()
        ui_gearDropDown.optionArray = gearOption.values
        ui_gearDropDown.optionIds = gearOption.ids
        ui_gearDropDown.checkMarkEnabled = false
        ui_gearDropDown.didSelect{(selectedText , index , id) in
            self.selectedGear = selectedText
        }
        
        let carOption = CarTypeOption()
        ui_cartypeDropDown.optionArray = carOption.values
        ui_cartypeDropDown.optionIds = carOption.ids
        ui_cartypeDropDown.checkMarkEnabled = false
        ui_cartypeDropDown.didSelect{(selectedText , index , id) in
            self.selectedCarType = selectedText
        }
        
        let depositOption = BoolTypeOption()
        ui_depositDropDown.optionArray = depositOption.values
        ui_depositDropDown.optionIds = depositOption.ids
        ui_depositDropDown.checkMarkEnabled = false
        ui_depositDropDown.didSelect{(selectedText , index , id) in
            self.depositState = selectedText
        }
        
        if oneProduct != nil {
            
            updateView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func imageUploadBtn(_ sender: UIButton) {
//        let intTag = sender.tag
//        if sender.currentImage!.isEqual(UIImage(named: "add"))
//        {
        selectImage()
//        }
//        else{
//        guard let indexPath = self.collctnVW_imagesToUplosd.indexPathsForVisibleItems.first.flatMap({
//            IndexPath(item: (intTag-10) , section: $0.section)
//        }), self.collctnVW_imagesToUplosd.cellForItem(at: indexPath) != nil else {
//            return
//        }
//            let indx = IndexPath.init(row: intTag-10, section: 0)
//           // self.collctnVW_imagesToUplosd.selectItem(at: indx, animated: true, scrollPosition: [])
//          //  self.collctnVW_imagesToUplosd.scrollToItem(at: indx, at: .centeredHorizontally, animated: false)
//
//            let visibleItems: NSArray = self.collctnVW_imagesToUplosd.indexPathsForVisibleItems as NSArray
//
//            var minItem: NSIndexPath = visibleItems.object(at: intTag-10) as! NSIndexPath
//            for itr in visibleItems {
//
//                if minItem.row > (itr as AnyObject).row {
//                    minItem = itr as! NSIndexPath
//                }
//            }
//
//            let nextItem = NSIndexPath(row: minItem.row + 1, section: 0)
//            self.collctnVW_imagesToUplosd.scrollToItem(at: indx, at: .centeredHorizontally, animated: true)
//

            //self.collctnVW_imagesToUplosd.scrol
//        }
    }
    
    
    @IBAction func addimage1(_ sender: UIButton) {
        
        
        addimg1.setImage(UIImage.init(named: "minus"), for: .normal)
        selectImage()
        
      
    }
    
    @IBAction func addimage2(_ sender: Any) {
        addimg2.setImage(UIImage.init(named: "minus"), for: .normal)
               selectImage()
        
      }
    @IBAction func addimage3(_ sender: Any) {
        addimg3.setImage(UIImage.init(named: "minus"), for: .normal)
                      selectImage()
      }
    @IBAction func addimage4(_ sender: Any) {
        addimg4.setImage(UIImage.init(named: "minus"), for: .normal)
                      selectImage()
      }
    @IBAction func addimage5(_ sender: Any) {
       addimg5.setImage(UIImage.init(named: "minus"), for: .normal)
        selectImage()
        
      }
    @IBAction func addimage6(_ sender: Any) {
       addimg6.setImage(UIImage.init(named: "minus"), for: .normal)
        selectImage()
      }
    
    func updateView() {
        
        ui_titleTxt.text = oneProduct?.title
        selectedFuel = oneProduct!.fuel_type
        ui_fuelDropDown.text = selectedFuel
        selectedGear = oneProduct!.gear_type
        ui_gearDropDown.text = selectedGear
        ui_doorTxt.text = oneProduct!.door_number
        selectedCarType = oneProduct!.car_type
        ui_cartypeDropDown.text = selectedCarType
        
        depositState = oneProduct!.deposit
        ui_depositDropDown.text = depositState
        
        ui_priceTxt.text = oneProduct?.price
        
        if oneProduct?.date_unit == "Gün" {
            
            selectedPeriod = 1
            ui_dayRadio.isOn = true
        } else if oneProduct?.date_unit == "Hafta" {
            
            selectedPeriod = 2
            ui_weekRadio.isOn = true
        } else if oneProduct?.date_unit == "Ay" {
            
            selectedPeriod = 3
            ui_monthRadio.isOn = true
        }
        
        ui_descriptionTxtView.text = oneProduct?.description
        
        depositState = oneProduct!.deposit
        latitude = Double(oneProduct!.lat)!
        longitude = Double(oneProduct!.lng)!
        ui_addrLbl.text = oneProduct?.address
        
        if oneProduct!.image_url.starts(with: "http") {

            let str = oneProduct!.image_url.components(separatedBy: ",")
            ui_uploadImg.sd_setImage(with: URL(string: str[0]))
            
        }
        
    }
    
    @IBAction func onCheckBoxPress(_ sender: GDCheckbox) {
        
        getPeriodVal(sender.tag)
    }
    
    @IBAction func onClickDaily(_ sender: Any) {
        ui_dayRadio.isOn = true
        getPeriodVal(1)
    }
    
    @IBAction func onClickWeek(_ sender: Any) {
        ui_weekRadio.isOn = true
        getPeriodVal(2)
    }
    
    @IBAction func onClickMonth(_ sender: Any) {
        ui_monthRadio.isOn = true
        getPeriodVal(3)
    }
    
    func getPeriodVal(_ val : Int) {
        
        selectedPeriod = val
        
        if val == 1 {
            ui_weekRadio.isOn = false
            ui_monthRadio.isOn = false
        } else if val == 2 {
            ui_dayRadio.isOn = false
            ui_monthRadio.isOn = false
        } else if val == 3 {
            ui_dayRadio.isOn = false
            ui_weekRadio.isOn = false
        }
    }
    
    func selectImage(){
        
        let galleryAction = UIAlertAction(title: "galeriden", style: .destructive) { (action) in
            self.openGallary()
           // self.uploadMedia(completion:"image")
        }
        let cameraAction = UIAlertAction(title: "kameradan", style: .destructive) { (action) in
            self.openCamera()
        }
        let cancelAction = UIAlertAction(title:R_EN.string.CANCEL, style: .cancel, handler : nil)
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: R_EN.string.APP_TITLE, message: R_EN.string.CORNFRIM_IMAGE_SETMODE, preferredStyle: .actionSheet)
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)

    }
    
    var imageurl = "imagepath"
    //MARK:- image choose from camera
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            //If you dont want to edit the photo then you can set allowsEditing to false
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
        //    func uploadMedia(completion: @escaping (_ url: String?) -> Void) {
                     
        }
        else{
            let alert  = UIAlertController(title: "Uyarı", message: "Kameran yok", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R_EN.string.OK, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
     //MARK:- image choose from gallary
     func openGallary(){
         imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
         //If you dont want to edit the photo then you can set allowsEditing to false
         imagePicker.allowsEditing = true
         imagePicker.delegate = self
        
         self.present(imagePicker, animated: true, completion: nil)
     }
    //MARK:- imageView clickable func
    func setClickableLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddApartmentFlatVC.tapFunction))
        
        ui_uploadImg.isUserInteractionEnabled = true
        ui_uploadImg.addGestureRecognizer(tap)
    }
    //MARK:- select image func call
    @objc func tapFunction(sender:UITapGestureRecognizer) {

           selectImage()
            
        }
    
    @IBAction func onClickLocationButton(_ sender: Any) {
        
        let toSearch = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        toSearch.delegate = self
        self.modalPresentationStyle = .fullScreen
        self.present(toSearch, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickUpload(_ sender: Any) {
        
        var showStr = ""
        
        let titleTxt = ui_titleTxt.text!.trimmed
        let doorNum = ui_doorTxt.text!.trimmed
        let priceTxt = ui_priceTxt.text!.trimmed
        let desciptTxt = ui_descriptionTxtView.text!.trimmed
        let addrTxt = ui_addrLbl.text!.trimmed
        let lat = "\(latitude)"
        let lng = "\(longitude)"
        let zipCode = "123456"
        
        if titleTxt.isEmpty {
            showStr = R_EN.string.ENTER_PRODUCT_TITLE
        } else if selectedFuel.isEmpty {
            showStr = R_EN.string.SELECT_FUEL
        }
        else if selectedGear.isEmpty {
            showStr = R_EN.string.SELECT_GEAR
        }
        else if doorNum.isEmpty {
            showStr = R_EN.string.ENTER_ROOM_NUMBER
        }
        
        else if selectedCarType.isEmpty {
            showStr = R_EN.string.SELECT_CARTYPE
        }
         
        else if selectedPeriod == 0 {
            showStr = R_EN.string.ENTER_PRODUCT_PRICETYPE
        }
        
        else if priceTxt.isEmpty {
            showStr = R_EN.string.ENTER_PRODUCT_PRICE
        }
        
        else if depositState.isEmpty {
            showStr = R_EN.string.SELECT_DEPOSIT
        }
        else if addrTxt.isEmpty {
            showStr = R_EN.string.SELECT_ADDR
        }
        
        if showStr.isEmpty {
            
            
            
            var imageStrings: String!
                     
            
            self.showALLoadingViewWithTitle(title: "İlanlar yükleniyor ", type: .messageWithIndicator )
            uploadMedia() { url in
             guard let url = url else {
                
                self.hideALLoadingView()
                return }
                imageStrings = url
                
                if self.oneProduct != nil {
                    
                    self.gotoUpdateCarApi(title: titleTxt, fuel : self.selectedFuel, gear: self.selectedGear, door: doorNum, carType : self.selectedCarType, priceType : priceOption[self.selectedPeriod], priceVal : priceTxt, deposition : self.depositState, description : desciptTxt, image : self.uplodimgarray, addr : addrTxt, lat : lat, lng : lng, zipCode: zipCode)
                } else {
                    
                    self.gotoUpdateCarApi(title: titleTxt, fuel : self.selectedFuel, gear: self.selectedGear, door: doorNum, carType : self.selectedCarType, priceType : priceOption[self.selectedPeriod], priceVal : priceTxt, deposition : self.depositState, description : desciptTxt, image : self.uplodimgarray, addr : addrTxt, lat : lat, lng : lng, zipCode: zipCode)
                }
            }
        } else {
            showToast(showStr, duration: 1, position: .top)
            return
        }
    }
    
    func gotoUploadCarApi(title: String, fuel : String, gear: String, door: String, carType : String, priceType : String, priceVal : String, deposition : String, description : String, image : Array<Any>, addr : String, lat : String, lng : String, zipCode: String) {
        
        let ownerid = Auth.auth().currentUser!.uid
        
        let productDict: [String: Any] = [ProductData.title: title, ProductData.room_number: "", ProductData.heating: "", ProductData.furbished: "", ProductData.date_unit: priceType, ProductData.price: priceVal, ProductData.deposit: deposition, ProductData.description: description, ProductData.address: addr, ProductData.lat: lat, ProductData.lng: lng, ProductData.zip_code: zipCode, ProductData.owner_id: ownerid, ProductData.image_url: uplodimgarray, ProductData.bed_capacity: "", ProductData.captan: "", ProductData.car_type: carType, ProductData.category: "2", ProductData.color: "", ProductData.created_at: "", ProductData.door_number: door, ProductData.fuel_type: fuel, ProductData.gear_type: gear, ProductData.gender: "", ProductData.membershipState: ShareData.user_info.membership!, ProductData.person_capacity: "", ProductData.rental_status: "", ProductData.score: "", ProductData.size: "", ProductData.updated_at: ""]
        
        ProductData.dbProRef.child(oneProduct!.product_id).updateChildValues(productDict)
        
        
        
        
        //self.showToast("Success!", duration: 2, position: .top)
        self.hideALLoadingView()
        self.gotoAddProductSucessVC ()
        print("imagekaarray",ProductData.image_url)
        
    }
    
    func gotoUpdateCarApi(title: String, fuel : String, gear: String, door: String, carType : String, priceType : String, priceVal : String, deposition : String, description : String, image : Array<Any>, addr : String, lat : String, lng : String, zipCode: String) {
        
        let ownerid = Auth.auth().currentUser!.uid
        let productId = UUID().uuidString
        
        let productDict: [String: Any] = [ProductData.title: title, ProductData.room_number: "", ProductData.heating: "", ProductData.furbished: "", ProductData.date_unit: priceType, ProductData.price: priceVal, ProductData.deposit: deposition, ProductData.description: description, ProductData.address: addr, ProductData.lat: lat, ProductData.lng: lng, ProductData.zip_code: zipCode, ProductData.owner_id: ownerid, ProductData.image_url: uplodimgarray, ProductData.bed_capacity: "", ProductData.captan: "", ProductData.car_type: carType, ProductData.category: "1", ProductData.color: "", ProductData.created_at: "", ProductData.door_number: door, ProductData.fuel_type: fuel, ProductData.gear_type: gear, ProductData.gender: "", ProductData.membershipState: "", ProductData.person_capacity: "", ProductData.rental_status: "", ProductData.score: "", ProductData.size: "", ProductData.updated_at: "", ProductData.product_id: productId]
        
        ProductData.dbProRef.child(productId).setValue(productDict)
      //  ProductData.product_info = ProductModels.init(dictPro: productDict)
        
        
        //self.showToast("Success!", duration: 2, position: .top)
        self.hideALLoadingView()
        self.gotoAddProductSucessVC ()
        print("Product id is \(productId)")
        print("akkarhogaya",ProductData.image_url)
        
        
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     //MARK:- image uploading
        func uploadMedia(completion: @escaping (_ url: String?) -> Void) {
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("images").child(imageName)
           
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            //ui_uploadImg.image error
            guard let imageData = self.ui_uploadImg.image!.jpegData(compressionQuality: 0.75) else { return }
            storageRef.putData(imageData, metadata: metaData) { (metaData, error) in
              
              if error == nil, metaData != nil {

                storageRef.downloadURL(completion: { (url, error) in
                    if let urlText = url?.absoluteString {
                        
                        print("imageaagai",urlText)
                        self.uplodimgarray.append(urlText)
                        completion(urlText)

                    }
                  
                })
                
                
                
              } else {
                  // failed
                  completion(nil)
              }
            
            }
        }
    }


    //extension AddApartmentFlatVC : UICollectionViewDelegate,UICollectionViewDataSource {
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        uploadedimageArray.count
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadimageCollectionViewCell", for: indexPath) as! UploadimageCollectionViewCell
    //
    //        cell.uploadedimage.image = uploadedimageArray[indexPath.row]
    //
    //        return cell
    //    }
    //
    //
    //
    //
    //
    //
    //}


    //MARK:-UIImagePickerControllerDelegate
    extension AddCarVC:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.editedImage] as? UIImage {
                self.ui_uploadImg.image = selectedImage
                self.showALLoadingViewWithTitle(title: "İlanlar yükleniyor ", type: .messageWithIndicator )
                let imageName = NSUUID().uuidString
                                     let storageRef = Storage.storage().reference().child("images").child(imageName)
                                    
                                     let metaData = StorageMetadata()
                                     metaData.contentType = "image/jpg"
                                     
                                     //ui_uploadImg.image error
                                     guard let imageData = self.ui_uploadImg.image!.jpegData(compressionQuality: 0.75) else { return }
                                     storageRef.putData(imageData, metadata: metaData) { (metaData, error) in
                                       
                                       if error == nil, metaData != nil {

                                         storageRef.downloadURL(completion: { (url, error) in
                                             if let urlText = url?.absoluteString {
                                                 
                                                 print("imageaagai",urlText)
                                              self.imageurl = urlText


                                              //   completion(urlText)
                                                self.hideALLoadingView()
                                                self.uplodimgarray.append(urlText)
                                               DispatchQueue.main.async {
                                                    self.collctnVW_imagesToUplosd.reloadData()
                                               // self.collctnVW_imagesToUplosd.performBatchUpdates(nil, completion: nil)
                                                let tmpButton:UIButton = (self.view.viewWithTag(10+self.uplodimgarray.count) as? UIButton)!
                                                
                                                let string = self.uplodimgarray[self.uplodimgarray.count-1]
                                                 let url = URL(string: string)
                                                 let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise
                                                tmpButton.setImage(UIImage.init(data: data!), for: .normal)
                                                // tmpButton.setBackgroundImage.sd_setImage(with: url, completed: nil)
                                                }
                                                
                                                    print("imageArray",self.uplodimgarray)
                                                                                          

                                             }
                                             
                                            //self.ui_uploadImg.isHidden = true
                                           
                                         })

                                       } else {
                                           // failed
                                         //  completion(nil)
                                       }
                                     
                                     }
                         
                                // }
                       //   self.present(imagePicker, animated: true, completion: nil)
                
               picker.dismiss(animated: true, completion: nil)
                
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.isNavigationBarHidden = false
            self.dismiss(animated: true, completion: nil)
        }
        
        
    
    }


extension AddCarVC: SearchViewControllerDelegate {
    
    func myVCDidFinish(city: String, lat: Double, lng: Double) {
        
        ui_addrLbl.text = city;
        latitude = lat
        longitude = lng
    }
   
}
extension AddCarVC : UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.collctnVW_imagesToUplosd)
        {
            if(oneProduct != nil){
               return oneProduct!.image_urls.count
//            if oneProduct!.image_url.starts(with: "http") {
//
//
//                              let str = oneProduct!.image_url.components(separatedBy: ",")
//                              print(str)
//
//                       return str.count
//
//
//
//                    }
            }
            else
            {
           return self.uplodimgarray.count
            }
            return 0;
        }
        else
        {
             return 6
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == self.collctnVW_imagesToUplosd)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddItemCell", for: indexPath) as! AddItemCell
            
           if oneProduct == nil {
           // let url = URL(string: self.uplodimgarray[indexPath.row])
            let string = self.uplodimgarray[indexPath.row]
            let url = URL(string: string)
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            //imageView.image = UIImage(data: data!)
           // cell.image.image = UIImage(data: data!)
            cell.imageVWItem.sd_setImage(with: url, completed: nil)
            }
           else if(oneProduct!.image_urls.count > 0 ){
            cell.imageVWItem.sd_setImage(with: URL.init(string: oneProduct!.image_urls![indexPath.row] as! String), completed: nil)
//            if oneProduct?.image_url.starts(with: "http") ?? false {
//
//
//                let str = oneProduct!.image_url.components(separatedBy: ",")
//                if indexPath.row == 0{
//
//                    cell.image.sd_setImage(with: URL(string: str[0]))
//
//
//
//                }else{
//
//                    let index = str[0].index(str[0].startIndex, offsetBy: 26)
//
//                    let baseurl = String(str[0].prefix(upTo: index))
//
//                    print(baseurl)
//
//                        cell.image.sd_setImage(with: URL(string: baseurl + str[indexPath.row]))
//
//
//
//                }
 
                 }
                 else {
                     
                  cell.imageVWItem.image = UIImage(named: oneProduct!.placeHolerImage)
                     
                 }

            return cell
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addcarcell", for: indexPath) as! addcarcell
        
        
        
        
             return cell
        }
        
      
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

           collectionView.performBatchUpdates(nil, completion: nil)
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height:  self.view.frame.size.height)
//        self.collctnVW_imagesToUplosd.item:CGSize(view.frame.width, self.view.frame.size.height)];
//
//           switch collectionView.indexPathsForSelectedItems?.first {
//           case .some(indexPath):
//               let height = (view.frame.width) * 3/4
//               return CGSize(width: view.frame.width, height: height + 50 + 150)
//           default:
//               let height = (view.frame.width) * 9 / 16
//               return CGSize(width: view.frame.width, height: height + 50 + 50)
//           }
       }
       
    
    
}

