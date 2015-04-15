//
//  WESAcronym.m
//  WESOptGuide
//
//  Created by Matt Remick on 12/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "WESAcronym.h"

@interface WESAcronym()

@property (strong, nonatomic) NSArray *meaningArray;

@end

@implementation WESAcronym

- (instancetype)initWithAcronym:(NSString *)acronym meaning:(NSString *)meaning {
    self = [super init];
    
    if (self) {
        _acronym = acronym;
        _meaning = meaning;
    }
    
    return self;
}



- (NSMutableDictionary *)acronymDictionary {
    if (!_acronymDictionary) {
        
        _acronymDictionary = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < self.acronymArray.count; i++) {
            NSString *acronym = [self.acronymArray objectAtIndex:i];
            NSString *meaning = [self.meaningArray objectAtIndex:i];
            
            [_acronymDictionary setObject:meaning forKey:acronym];
        }
    }
    
    return _acronymDictionary;
}

- (NSArray *)acronymArray {
    
    if (!_acronymDictionary) {
        NSArray *array = @[@"A.d@", @"A/V@", @"AAO@", @"AASA@", @"ABA@", @"ABK@", @"ABMD@", @"AC@", @"AC/A@", @"ACG@", @"AC-IOL@", @"AG@", @"AION@", @"AK@", @"ALT@", @"AMD@", @"AMPPE@", @"AOA@", @"AOF@", @"APD@", @"AR@", @"ARC@", @"ARN@", @"ASC@", @"AT@", @"AV@", @"Ax@", @"BARN@", @"BC@", @"BCVA@", @"BDR@", @"bid@", @"BIO@", @"BP@", @"BRVO@", @"BSS@", @"BV@", @"BVD@", @"BVP@", @"Bx@", @"C@", @"C/D@", @"C/F@", @"C/O@", @"CACG@", @"Cat@", @"CB@", @"CBC@", @"cc@", @"CCF@", @"CCT@", @"CE@", @"CE-IOL@", @"CF@", @"CHED@", @"CHRPE@", @"CI@", @"CLARE@", @"CLIDE@", @"CLEX@", @"CMA@", @"CME@", @"CMS@", @"CMV@", @"CN@", @"CNS@", @"CNV@", @"CNVM@", @"COA@", @"COAG@", @"Conj@", @"COVD@", @"CPM@", @"CRAO@", @"CRVO@", @"CSM@", @"CSME@", @"CSR@", @"CT@", @"CTL@", @"CVA@", @"CVF@", @"CVS@", @"CW@", @"CWS@", @"Cyl@", @"D@", @"D/C@", @"D/Q@", @"dARMD@", @"DC@", @"DDT@", @"dDx@", @"DES@", @"DFE@", @"DM@", @"DOB@", @"DR@", @"DS@", @"DSAK@", @"DST@", @"DV@", @"DVD@", @"ECCE@", @"EF@", @"EKC@", @"EOG@", @"EOM@", @"EP@", @"ERG@", @"ERM@", @"ESR@", @"ET@", @"ETDRS@", @"EUA@", @"EV@", @"F/U@", @"FA@", @"FAAO@", @"FACP@", @"FACS@", @"FANG@", @"FAZ@", @"FB@", @"FBS@", @"FBS@", @"FD@", @"FTFC@", @"FTKA@", @"Fx@", @"GA@", @"GCA@", @"GH@", @"GL@", @"Glc@", @"GPC@", @"gtt@", @"gtts@", @"HA@", @"HARC@", @"HEMA@", @"HM@", @"HSK@", @"HTN@", @"HVF@", @"HVID@", @"Hx@", @"HZO@", @"IAB@", @"ICCE@", @"ICE@", @"ICL@", @"ICSC@", @"IDDM@", @"IK@", @"ILM@", @"IO@", @"IOL@", @"ION@", @"IOP@", @"IR@", @"IRMA@", @"IVFA@", @"IXT@", @"JRA@", @"K@", @"KCS@", @"KP@", @"KS@", @"LASEK@", @"LASIK@", @"LEE@", @"LHH@", @"LL@", @"LP@", @"LPI@", @"LProj@", @"LTG@", @"LTK@", @"LV@", @"LVA@", @"LVR@", @"M@", @"M&N@", @"MA@", @"MCE@", @"MCT@", @"MES@", @"MG@", @"MGD@", @"MI@", @"MM@", @"MMC@", @" MR@", @"MS@", @"N@", @"NAG@", @"NCT@", @"NBEO@", @"ND@", @"Nd-YAG@", @"NFL@", @"NI@", @"NIDDM@", @"NLP@", @"NPA@", @"NPC@", @"NPDR@", @"NRC@", @"NS@",@"NSAID@", @"NTG@", @"NV@", @"NVD@", @"NVE@", @"NVG@", @"NVI@", @"OAG@", @"OC@", @"OCT@", @"OD@", @"OEP@", @"OHT@", @"OKN@", @"ONH@", @"ORA@", @"OS@", @"OTC@", @"OU@", @"Pach@", @"PAM@", @"PAS@", @"PBK@", @"PC@", @"PC-IOL@", @"PCN@", @"PCO@", @"PD@", @"PDS@", @"PEK@", @"PDT@", @"PE@", @"PED@", @"PERRLA@", @"PF@", @" PF@", @"PH@", @"Phaco@", @"PI@", @"PKP@", @"PL@", @"Plo@", @"PMMA@", @"po@", @"POAG@", @"POHS@", @"PPA@", @"PPV@", @"PRK@", @"Prn@", @"PRP@", @"PSC@", @"Pt@", @"PTK@", @"PVD@", @"PVD@", @"PXE@", @"PXE@", @"PXF@", @"q2h@", @"qd@", @"qhs@", @"qid@", @"RA@", @"Rb@", @"RD@", @"REE@", @"RGP@", @"RHH@", @"RK@", @"RLE@", @"RLFP@", @"RNFL@", @"ROP@", @"RP@", @"RPE@", @"RS@", @"RTC@", @"Rx@", @"s@", @"S/P@", @"S/S@", @"SAP@", @"sc@", @"SCCO@", @"SCH@", @"SCL@", @"SiH@", @"SLE@", @"SLK@", @"SLT@", @"SO@", @"SPEE@", @"Sph@", @"SPK@", @"SR@", @"SRF@", @"SRx@", @"SVP@", @"Sx@", @"TBUT@", @"TIA@", @"tid@", @"TID@", @"TM@", @"TTT@", @"Tx@", @"UARC@", @"UCB@", @"UGH@", @"UL@", @"ung@", @"VA@", @"VEP@", @"VER@", @"VF@", @"VG@", @"VKH@", @"VPA@", @"VSP@", @"VTX@", @"w/o@", @"W4D@", @"wARMD@", @"WD@", @"WUCO@", @"X/365@", @"XP@", @"XT@", @"YAG@"];
        
        NSMutableArray *newAcronymArray = [NSMutableArray new];
        
        for (int i = 0; i < array.count; i++) {
            NSString *string = [array objectAtIndex:i];
            if ([string containsString:@"@"]) {
                NSString *newString = [string stringByReplacingOccurrencesOfString:@"@" withString:@""];
                [newAcronymArray insertObject:newString atIndex:i];
            }
            
        }
        
        _acronymArray = newAcronymArray;
    }
    
    return _acronymArray;
    
    
}

- (NSArray *)meaningArray {
    
    if (!_meaningArray) {
        NSArray *anotherArray = @[@"As Directed@",@"Arteriole / Venuole ratio@", @"American Academy of Optometry@",@"Alcohol Assisted Surface Ablation@",@"Applied behavioral analysis@",@"Aphakic Bullous Keratopathy@",@"Anterior Basement Membrane Dystrophy@",@"Anterior Chamber@",@"Accommodative Convergence/Accm ratio@",@"Angle Closure Glaucoma@",@"Anterior Chamber Intraocular Lens@",@"Amsler Grid@",@"Anterior Ischemic Optic Neuropathy@",@"Astigmatic Keratotomy@",@"Argon LASER Trabeculoplasty@",@"Age Related Macular Degeneration@",@" Acute Multifocal placoid pigment epitheliopathy@",@"American Optometric Association@",@"American Optometric Foundation@",@"Afferent Pupillary Defect@",@"Anti-Reflective@",@"Anomalous Retinal Correspondence@",@"Acute Retinal Necrosis@",@"Anterior Subcapsular Cataract@",@" Atropine or Artificial Tears@",@"Arteriovenous ratio@",@"Advice@",@"Bilateral Acute Retinal Necrosis@",@"Base Curve@",@"Best Corrected Visual Acuity@",@"Background Diabetic Retinopathy@",@"Twice a day@",@"Binocular Indirect Ophthalmoscopy@",@"Blood Pressure@",@"Branch Retinal Vein Occlusion@",@"Balanced Salt Solution@",@"Binocular Vision@",@"Back Vertex Distance@",@"Back Vertex Power@",@"Biopsy@",@" With @",@"Cup to Disc Ratio @",@"Cells/Flare@",@"Complaint Of@",@"Chronic Angle Closure Glaucoma@",@"Cataract@",@"Ciliary Body@",@"Complete Blood Count@",@"With Correction@",@"Carotid-Cavernous (sinus) Fistula@",@"Central Corneal Thickness@",@"Cataract Extraction@",@"Cataract Extraction with Implant@",@"Count Fingers@",@"Congenital Hereditary Endthelial Dystrophy@",@"Congenital Hypertrophy of RPE@",@"Convergence Insufficiency@",@"CTL Associated Red Eye@",@"Contact Lens Induced Dry Eye@",@"Contact Lens Exam@",@"Compound Myopic Astigmatism@",@"Cystoid Macular Edema@",@"Center for Medicare/Medicaid Services@",@"Cytomegalovirus@",@"Cranial Nerve@",@"Central Nervous System@",@"Choroidal Neovascular Membrane@",@"Choroidal Neovascular Membrane@",@"California Optometric Association@",@"Chronic Open Angle Glaucoma@",@"Conjunctiva@",@"College of Optometrists in Vision Development@",@"Continue Present Meds@",@"Central Retinal Artery Occlusion@",@"Central Retinal Vein Occlusion@",@"Central, Steady and Maintained@",@"Clinically Significant Macular Edema@",@"Central Serous Retinopathy@",@"Cover Test@",@"Contact Lens@",@"Cerebral Vascular Accident@",@"Confrontation Visual Field@",@"Computer Vision Syndrome@",@"Close Work@",@"Cotton Wool Spot@",@"Cylinder@",@"Diopters@",@"Discontinue@",@"Deep and Quiet@",@"Dry Age Related Macular Degeneration@",@"Diopters Cylinder@",@"Dyslexia Determination Test@",@"Differential Diagnosis@",@"Dry Eye Syndrome@",@"Dilated Fundus Exam@",@"Diabetes Mellitus@",@"Date of Birth@",@"Diabetic Retinopathy@",@"Diopters Sphere@",@"Descemet Stripping Endothelial Keratoplasty@",@"Dyslexia Screening Test@",@"Distance Vision@",@"Dissociated Vertical Deviation@",@"Extracapsular Cataract Extraction@",@"Eccentric Fixation@",@"Epidemic Keratoconjunctivitis@",@"Electrooculogram@",@"Extraocular Muscles@",@"Esophoria@",@"Electroretinogram@",@"Epi-Retinal Membrane@",@"Erthyrocyte Sedimentation Rate@",@"Esotropia@",@"Early Treatment of Diabetic Retinopathy Study@",@"Examination Under Anesthesia@",@"Eccentric viewing@",@"Follow Up appointment@",@"Flouroscein Angiogram@",@"Fellow, American Academy of Optometry@",@"Fellow@", @"American College of Pediatrics@", @"Fellow, American College of Surgeons@",@"Flouroscein Angiogram@",@"Foveal Avascular Zone@",@"Foreign Body@",@"Fasting Blood Sugar@",@"Foreign Body Sensation@",@"Fixation Disparity@",@"Full to Finger Count@",@"Failed to keep appointment@",@"Family History@",@"Geographic Atrophy@",@"Giant Cell Arteritis@",@"General Health@",@"Glasses@",@"Glaucoma@",@"Giant Papillary Conjunctivitis@",/*@"drop@",*/@"drops@",@"Headaches@",@"Harmonious Anomalous Retinal Correspondence@",@"Hydroxyethyl Methacrylate@",@"Hand Motion@",@"Herpes Simplex Keratitis@",@"Hypertension@",@"Humphrey Visual Field@",@"Horizontal Visible Iris Diameter@",@"History@",@"Herpes Zoster Ophthalmicus@",@"International Association of Boards@",@"Intracapsular Cataract Extraction@",@"Iridocorneal Endothelial Syndrome@",@"Implantable Lens@",@"Idiopathic Central Serous Choroidopathy@",@"Type I Diabetes@",@"Interstitial Keratitis@",@"Internal Limiting Membrane@",@"Inferior Oblique@",@"Intraocular lens@",@"Ischemic Optic Neuropathy@",@"Intraocular Pressure@",@"Inferior Rectus@",@"Intra-Retinal Microvascular Abnormality@",@"Intravenous Fluroscein Angiography@",@"Intermittent exotropia@",@"Juvenile Rheumatoid Arthritis@",@"Keratometry/Ophthalmometry@",@"Keratoconjunctivitis Sicca@",@"Keratic Percipitates@",@"Krukenberg’s Spindle@",@"LASER Assisted Keratomileusis@",@"LASER Assisted in situ Keratomileusis@",@"Last Eye Exam@",@"Left Homonomous Hemianopsia@",@"Lower Lid@",@"Light Perception@",@"LASER Peripheral Iridotomy@",@"Light Projection@",@"Low Tension Glaucoma@",@"LASER Thermal Keratoplasty@",@"Low Vision@",@"Low Vision Aid@",@"Low Vision Rehabilitation@",@"M-Units@",@"Mydriacyl and Neosynepherine@",@"Microaneurysm@",@"Microcystic Edema@",@"Modified Clinical Technique@",@"Medical Eye Services@",@"Myasthenia Gravis@",@"Meibomian Gland Dysfunction@",@"Myocardial Infarction@",@"Malignant Melanoma@",@"Mitomycin C@",@"Manifest (dry) Refraction@",@"Multiple Sclerosis@",@"Point Units@",@"Narrow Angle Glaucoma@",@"Non-Contact Tonometry@",@"National Boards of Examiners in Optometry@",@"Neutral Density@",@"Neodymium-doped YAG@",@"Nerve Fiber Layer@",@"No Improvement@",@"Type II Diabetes@",@"No Light Perception@",@"Near Point of Accommodation@",@"Near Point of Convergence@",@"Non Proliferative Diabetic Retinopathy@",@"Normal Retinal Correspondence@",@"Nuclear Sclerosis@",@"Non-Steroidal Anti-Inflammatory Drug@",@"Normal Tension Glaucoma@",@"Near Vision@",@"Neo Vascularization at the Disk@",@"Neo Vascularization Elsewhere@",@"Neovascular Glaucoma@",@"Neovascularization of Iris@",@"Open Angle Glaucoma@",@"Optical Center@",@"Optical Coherence Tomography@",@"Right Eye@",@"Optometric Extension Program@",@"Ocular Hypertensive@",@"Optokinetic Nystagmus@",@"Optic Nerve Head@",@"Ocular Response Analyzer@",@"Left Eye@",@"Over the Counter@",@"Both Eyes@",@"Pachymetry@",@"Potential Acuity Meter@",@"Peripheral Anterior Synchiae@",@"Pseudophakic Bullous Keratopathy@",@"Posterior Chamber@",@"Posterior Chamber Intraocular Lens@",@"Penicillin@",@"Posterior Capsule Opacity@",@"Pupillary Distance@",@"Pigment Dispersion Syndrome@",@"Punctate Epithelial Keratopathy@",@"Photo Dynamic Therapy@",@"Phacoemulsification@",@"Pigment Epithelial Detachment@",@"Pupils Equal, Round, Reactive to Light@",@"Prednisolone Forte@",@"Preservative Free@",@"Pinhole@",@"Phacoemulsification@",@"Peripheral Iridotomy@",@"Penetrating Keratoplasty@",@"Plano@",@"Plano@",@"Polymethyl Methacrylate@",@"Take by mouth@",@"Primary Open Angle Glaucoma@",@"Presumed Ocular Histoplasmosis Syndrome@",@"Peri-papillary Atrophy@",@"Par Plana Vitrectomy@",@"Photorefractive Keratectomy@",@"As Necessary@",@"Pan Retinal Photocoagulation@",@"Posterior Subcapsular Cataract@",@"Point Units@",@"Photo Therapeutic Keratectomy@",@"Posterior Vitreous Detachment@",@"Peripheral Vascular Disease@",@"Pseudoexfoliation@",@"Pseudoxanthoma Elasticum@",@"Pseudoexfoliation@",@"Every Two Hours@",@"Once a day@",@"Take at night@",@"Four times a day@",@"Rheumatoid Arthritis@",@"Retinoblastoma@",@"Retinal Detachment@",@"Routine Eye Exam@",@"Rigid Gas Permeable Contact Lens@",@"Right Homonomous Hemianopsia@",@"Radial Keratotomy@",@"Refractive Lensectomy@",@"Retrolental Fibroplasia@",@"Retinal Nerve Fiber Layer@",@"Retinopathy of Prematurity@",@"Retinitis Pigmentosa@",@"Retinal Pigment Epithelium@",@"Reduced Snellen@",@"Return to Clinic@",@"Prescription@",@"Without@",@"Status Post@",@"Signs/Symptoms@",@"Spontaneous Arterial Pulsation@",@"Without Correction@",@"Southern California College of Optometry@",@"Sub-Conjunctival Hemorrhage@",@"Soft Contact Lens@",@"Silicone Hydrogel@",@"Slit Lamp Exam@",@"Superior Limbic Keratoconjunctivitis@",@"Selective LASER Trabeculoplasty@",@"Superior Oblique@",@"Superficial Punctate Epithelial Erosion@",@"Sphere@",@"Superficial Punctate Keratopathy@",@"Superior Rectus@",@"Subretinal Fluid@",@"Spectacle Prescription@",@"Spontaneous Venous Pulsation@",@"Surgery@",@"Tear Break Up Time@",@"Transient Ischaemic attack@",@"Three Times a Day@",@"Transillumination Defects@",@"Trabecular Meshwork@",@"Transpupillary Thermotherapy@",@"Treatment@",@"Unharmonius Anomalous Retinal Correspondence@",@"University of California Berkeley@",@"Uveitis-Glaucoma-Hyphema Syndrome@",@"Upper Lid@",@"Ointment@",@"Visual Acuity@",@"Visual Evoked Potential@",@"Visual Evoked Response@",@"Visual Field@",@"Von Graefe@",@"Vogt-Koyanagi-Harada Syndrome@",@"Vertical Palpebral Aperture@",@"Vision Service Plan@",@"Vitrectomy@",@"Without@",@"Worth 4 Dot@",@"Wet Age Related Macular Degeneration@",@"Working Distance@",@"Western University College of Optometry@",@"X=# of days@",@"Exophoria@",@"Exotropia@",@"yttrium aluminum garnet LASER@"];
        
        
        
        NSMutableArray *newMeaningArray = [NSMutableArray new];
        for (int i = 0; i < anotherArray.count; i++) {
            NSString *string = [anotherArray objectAtIndex:i];
            if ([string containsString:@"@"]) {
                NSString *newString = [string stringByReplacingOccurrencesOfString:@"@" withString:@""];
                [newMeaningArray insertObject:newString atIndex:i];
            }
            
            _meaningArray = newMeaningArray;
            
        }
        
    }
    
    return _meaningArray;
}



@end
