    //
    //  RegisterView.swift
    //  Instagram
    //
    //  Created by Admin on 4/4/21.
    //

    import SwiftUI
    import Combine

    struct RegistrationView: View {
        @State var isEditing: Bool = false
        // navigate to verification view
        @State private var selection: String? = nil

        @State private var email:String = ""
        @State private var phone:String = ""
        @State private var fullname = ""
        @State private var username = ""
        @State private var password = ""
        @State private var selectedImage:UIImage?
        @State private var image:Image?
        @Environment(\.presentationMode) var mode
        @State var imagePickerPresented = false
        @State var isVerification = false
        
        @State var phoneNumber = ""
        @State var y : CGFloat = 350
        @State var countryCode = ""
        @State var countryFlag = ""
        
        @State var isInputPhoneNumber = true
        @State var isInputEmail = false
        @State var isShowSignInButton = true
//        var successClosure: (Bool) -> Void {
//            
//        }∫


        var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color("PrimaryColor")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                        //                    Spacer()
                        VStack(spacing:20){
                            VStack(alignment:.leading){
                                Text("Sign Up")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }.padding(.horizontal,32).frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            
                            Toggle( isInputEmail ? "Use Email" : "Use Phone Number", isOn: $isInputEmail)
                                .foregroundColor(.white)
                                .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))))
                                .padding(.horizontal,32)
                            
                            
                            if isInputEmail == true {
                                
                                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                                    .padding()
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(.horizontal,32)
                                   
                                
                            }
                            if isInputEmail == false{
                                
                              
                                    ZStack(alignment:.center) {
                                        HStack (spacing: 0) {
                                            Text(countryCode.isEmpty ? "🇹🇭 +66" : "\(countryFlag) +\(countryCode)")
                                                .frame(width: 100, height: 50)
                                                //                                            .background(Color.secondary.opacity(0.2))
                                                .background(Color(.init(white: 1, alpha: 0.15)))
                                                .cornerRadius(10)
                                                //                                            .foregroundColor(countryCode.isEmpty ? .secondary : .black)
                                                .foregroundColor(.white)
                                                .onTapGesture {
                                                    isShowSignInButton = false
                                                    withAnimation (.spring()) {
                                                        self.y = 0
                                                    }
                                                }
                                            TextField("Phone Number", text: $phone)
                                                
                                                .onChange(of: phone) { newValue  in
                                                 
                                                }
                                                .frame(width: 250, height: 50)
                                                .keyboardType(.phonePad)
                                                .background(Color(.init(white: 1, alpha: 0.15)))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        CountryCodes(countryCode: $countryCode, countryFlag: $countryFlag, y: $y)
                                         
                                            .offset(y: y)
                                        
                                        RoundedRectangle(cornerRadius: 10).stroke()
                                            .frame(width: 350, height: 50)
                                            .foregroundColor(.white)
                                    }   .zIndex(1).frame( height: 50, alignment: .center)
                                    
                                
                                
                            }
                            
                            CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                            CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                            CustomSecureField(text: $password, placeholder: Text("Password"))
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal,32)
                        }
                        .alert(isPresented: $isInputPhoneNumber, content: {
                            Alert(title: Text("Message"), message: Text("you're using phone number to register"), dismissButton: .default(Text("Bye alert!"), action: {
                                isInputPhoneNumber = true
                            }))
                        })
                        
                        
                
                        HStack{
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Forgot Password")
                            })
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.trailing,28)
                        }
                    ZStack{
                    
                 
                        Button(action: {
                            self.selection = "verification"
                            var phoneWithCountryCode = ""
                            
//                            if countryCode == "" {
//                                phoneWithCountryCode = "+66\(phone)"
//                            }
//                            if countryCode != ""{
//                                phoneWithCountryCode = "+\(countryCode)\(phone)"
//                            }
//
//                            //                        "+\(countryCode == "" ? "66" : countryCode + phone)"
//                            if (!email.isEmpty || !phone.isEmpty) && !password.isEmpty{
//
//                                if isInputEmail {
//                                    MobileVerificationNvm.shared.sendVerification(phoneNumber:email)
//                                    isVerification = true
//                                    tempData.email = email
//                                }
//
//                                else{
//                                    DispatchQueue.main.async {
//                                        //                                print("phone:\(phoneWithCountryCode)")
//                                        MobileVerificationNvm.shared.sendVerification(phoneNumber: phoneWithCountryCode)
//                                        isVerification = true
//                                        tempData.phone = phone
//                                    }
//
//                                }
//
//                            }
                            //                    viewModel.register(withEmail: email, password: password,image: selectedImage,fullname: fullname,username: username)
                        }, label: {
                            Text("Sign Up")
                        }).zIndex(0)
                        //                    Spacer()
                    }
                    .font(.headline)
                    .frame(width: 360, height: 50)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    //                .clipShape(Capsule())
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .padding()
                
                    .alert(isPresented: $isInputEmail, content: {
                        Alert(title: Text("Message"), message: Text("Now! you're using Email to register but you also register with email just swtich on togle button"), dismissButton: .default(Text("Bye alert!"), action: {
                            isInputEmail = true
                        }))
                    })
                    
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                        //                        isVerification = true
                    }, label: {
                        Text("Already have an account? ")
                            .font(.system(size: 14))
                            + Text("Sign In")
                            .font(.system(size: 14, weight: .bold))
                    })
                    .foregroundColor(.white)
                    .padding(.bottom,32)
                    
                    }
                 
                }
                .ignoresSafeArea()
                
            }
        
        }



    extension RegistrationView{
        func loadImage()  {
            guard let selectedImage = selectedImage else {
                return
            }
            image = Image(uiImage: selectedImage)
            
        }
    }
    //
    struct RegistrationView_Previews: PreviewProvider {
        
        static var previews: some View {
            RegistrationView()
        }
    }
