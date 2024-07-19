package com.example;

public class Medicine {
    private String medicineId;
    private String medicineName;
    private String unit; // 追加

    // デフォルトコンストラクター
    public Medicine() {}

    // 引数付きコンストラクター
    public Medicine(String medicineId, String medicineName, String unit) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.unit = unit; // 追加
    }

    public String getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(String medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getUnit() {
        return unit; // 追加
    }

    public void setUnit(String unit) {
        this.unit = unit; // 追加
    }
}
