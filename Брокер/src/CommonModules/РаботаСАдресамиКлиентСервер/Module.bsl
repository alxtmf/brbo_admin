///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Возвращает структуру полей адреса для программного формирования адреса.
//
// Возвращаемое значение:
//  Структура:
//    * Представление    - Строка - текстовое представление адреса по административно-территориальному делению.
//                                  Например, "175430, Новгородская обл, Валдайский р-н, Бор д, Полевая ул, дом 4"
//    * МуниципальноеПредставление - Строка - текстовое представление адреса по муниципальному делению.
//                                   Например, "175430, Новгородская обл, Валдайский муниципальный район, сельское
//                                   поселение Никулинское, Бор д, Полевая ул, дом 4";
//    * ТипАдреса        - Строка - основной тип адреса (только для адресов РФ).
//                                  Варианты: "Муниципальный", "Административно-территориальный".
//    * Страна           - Строка - текстовое представление страны. Например, "Россия".
//    * КодСтраны        - Строка - код страны по ОКСМ. Например, "643".
//    * Индекс           - Строка - почтовый индекс. Например, "12700".
//    * КодРегиона       - Строка - код региона РФ. Например, "50".
//    * Регион           - Строка - текстовое представление региона РФ. Например, "Московская"
//    * РегионСокращение - Строка - сокращение региона. Например, "обл".
//    * Округ            - Строка - текстовое представление округа (устарело).
//    * ОкругСокращение  - Строка - сокращение округа (устарело).
//    * Район            - Строка - текстовое представление района у адресов по административно-территориальному
//                                  делению. Например, "Валдайский".
//    * РайонСокращение  - Строка - сокращение района у адресов по административно-территориальному делению. Например, "р-н".
//    * МуниципальныйРайон - Строка - текстовое представление муниципального района у адресов по муниципальному делению.
//                                  Например, "Валдайский".
//    * МуниципальныйРайонСокращение - Строка - сокращение муниципального района у адресов по муниципальному делению.
//                                  Например, "м.р-н".
//    * Город            - Строка - текстовое представление города у адресов по административно-территориальному
//                                  делению. Например, "Валдай".
//    * ГородСокращение  - Строка - сокращение города  у адресов по административно-территориальному делению.  Например,
//                                  "г".
//    * Поселение            - Строка - текстовое представление поселения у адресов по муниципальному делению. Например,
//                                      "сельское поселение Никулинское".
//    * ПоселениеСокращение  - Строка - сокращение поселения у адресов по муниципальному делению. Например, "с.п.";
//    * ВнутригородскойРайон - Строка - текстовое представление внутригородского района. Например, "Центральный"
//    * ВнутригородскойРайонСокращение  - Строка - сокращение внутригородского района. Например, "мкр";
//    * НаселенныйПункт  - Строка - текстовое представление населенного пункта. Например, "Бор".
//    * НаселенныйПунктСокращение - Строка - сокращение населенного пункта. Например, "д".
//    * Территория            - Строка - текстовое представление территории. Например, "Мотор".
//    * ТерриторияСокращение  - Строка - сокращение территории. Например, "гск".
//    * Улица            - Строка - текстовое представление улицы. Например "Полевая".
//    * УлицаСокращение  - Строка - сокращение улицы. Например "ул".
//    * ДополнительнаяТерритория - Строка - текстовое представление дополнительной территории (устарело).
//    * ДополнительнаяТерриторияСокращение - Строка - сокращение дополнительной территории (устарело).
//    * ЭлементДополнительнойТерритории - Строка - текстовое представление элемента дополнительной территории (устарело).
//    * ЭлементДополнительнойТерриторииСокращение - Строка - сокращение элемента дополнительной территории (устарело).
//    * Здание - Структура - структура с информацией о здании адреса:
//       ** ТипЗдания - Строка  - тип объекта адресации адреса РФ согласно приказу Минфина России от 5.11.2015 г. N171н.
//       ** Номер - Строка  - текстовое представление номера дома (только для адресов РФ).
//    * Корпуса - Массив из Структура - содержит список корпусов и строений адреса:
//       * ТипКорпуса - Строка - наименование строения корпуса. Например, "Строение".
//       * Номер - Строка - номер строения или корпуса. Например, "1".
//    * Помещения - Массив из Структура:
//       * ТипПомещения - Строка - наименование помещения. Например, "Офис"
//       * Номер - Строка - номер помещения. Например, "1".
//    * ИдентификаторАдресногоОбъекта - УникальныйИдентификатор - идентификационный код последнего адресного объекта
//                                      в иерархи адреса. Например, для адреса: Москва г., Дмитровское ш., д.9 это
//                                     будет идентификатор улицы. Например, "8fe5e839-24c8-4500-bea8-a81a55a0fd1e"
//    * ИдентификаторДома - УникальныйИдентификатор - идентификационный код дома(строения) адресного объекта. 
//                            Например, "bc26bdef-12be-40f8-959c-2149de1911b9".
//    * Идентификаторы - Структура - идентификаторы адресных объектов адреса:
//       ** РегионИдентификатор - УникальныйИдентификатор
//                              - Неопределено - идентификатор региона.
//       ** РайонИдентификатор - УникальныйИдентификатор
//                             - Неопределено - идентификатор района.
//       ** МуниципальныйРайонИдентификатор - УникальныйИдентификатор
//                                          - Неопределено - идентификатор муниципального района.
//       ** ГородИдентификатор - УникальныйИдентификатор
//                             - Неопределено - идентификатор города.
//       ** ПоселениеИдентификатор - УникальныйИдентификатор
//                                 - Неопределено - идентификатор поселения.
//       ** ВнутригородскойРайонИдентификатор - УникальныйИдентификатор
//                                            - Неопределено - идентификатор
//                                                             внутригородского района.
//       ** НаселенныйПунктИдентификатор - УникальныйИдентификатор
//                                       - Неопределено - идентификатор населенного пункта.
//       ** ТерриторияИдентификатор - УникальныйИдентификатор
//                                  - Неопределено - идентификатор территории.
//       ** УлицаИдентификатор      - УникальныйИдентификатор
//                                  - Неопределено - идентификатор улица.
//    * КодыКЛАДР           - Структура - коды КЛАДР, если установлен параметр КодыКЛАДР. Например, "53004000040000200":
//       ** Регион          - Строка    - код КЛАДР региона.
//       ** Район           - Строка    - код КЛАДР район.
//       ** Город           - Строка    - код КЛАДР города.
//       ** НаселенныйПункт - Строка    - код КЛАДР населенного пункта.
//       ** Улица           - Строка    - код КЛАДР улицы.
//    * ДополнительныеКоды  - Структура - коды ОКТМО, ОКТМО, ОКАТО, КодИФНСФЛ, КодИФНСЮЛ, КодУчасткаИФНСФЛ, КодУчасткаИФНСЮЛ.
//    * Комментарий - Строка - комментарий к адресу.
//
Функция ПоляАдреса() Экспорт
	
	Возврат КонструкторПолейАдреса();
	
КонецФункции

// Оставленная для обратной совместимости. Возвращает структуру контактной информации по типу.
// Для получения полей адреса следует использовать РаботаСАдресамиКлиентСервер.ПоляАдреса.
// Для получения полей телефона следует использовать УправлениеКонтактнойИнформацией.СведенияОТелефоне.
//
// Параметры:
//  ТипКИ - ПеречислениеСсылка.ТипыКонтактнойИнформации - тип контактной информации.
//  ФорматАдреса - Строка - тип возвращаемой структуры в зависимости от формата адреса: "КЛАДР" или "ФИАС".
// 
// Возвращаемое значение:
//  Структура - пустая структура контактной информации, ключи - имена полей, значения поля.
//
Функция СтруктураКонтактнойИнформацииПоТипу(ТипКИ, ФорматАдреса = "КЛАДР") Экспорт
	
	Если ТипКИ = ПредопределенноеЗначение("Перечисление.ТипыКонтактнойИнформации.Адрес") Тогда
		Возврат СтруктураПолейАдреса(ФорматАдреса);
	ИначеЕсли ТипКИ = ПредопределенноеЗначение("Перечисление.ТипыКонтактнойИнформации.Телефон") Тогда
		Возврат УправлениеКонтактнойИнформациейКлиентСервер.СтруктураПолейТелефона();
	Иначе
		Возврат Новый Структура;
	КонецЕсли;
	
КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция ОсновнаяСтрана() Экспорт
	Возврат ПредопределенноеЗначение("Справочник.СтраныМира.Россия");
КонецФункции

Функция ЭтоМуниципальныйАдрес(ТипАдреса) Экспорт
	Возврат СтрСравнить(ТипАдреса, МуниципальныйАдрес()) = 0;
КонецФункции

Функция ЭтоОсновнаяСтрана(Страна) Экспорт
	Возврат СтрСравнить(ОсновнаяСтрана(), Страна) = 0;
КонецФункции

Функция АдминистративноТерриториальныйАдрес() Экспорт
	Возврат "Административно-территориальный";
КонецФункции

Функция МуниципальныйАдрес() Экспорт
	Возврат "Муниципальный";
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Возвращаемое значение:
//  Структура:
//   * КодыКЛАДР - Структура:
//     ** Улица - Строка
//      ** НаселенныйПункт - Строка
//      ** Город - Строка
//      ** Район - Строка
//      ** Регион - Строка
//   * ДополнительныеКоды - Структура:
//      ** КодУчасткаИФНСЮЛ - Строка
//      ** КодУчасткаИФНСФЛ - Строка
//      ** КодИФНСЮЛ - Строка
//      ** КодИФНСФЛ - Строка
//      ** ОКАТО - Строка
//      ** ОКТМО - Строка
//   * Идентификаторы - Структура:
//      ** УлицаИдентификатор - Неопределено
//      ** ТерриторияИдентификатор - Неопределено
//      ** НаселенныйПунктИдентификатор - Неопределено
//      ** ВнутригородскойРайонИдентификатор - Неопределено
//      ** ПоселениеИдентификатор - Неопределено
//      ** ГородИдентификатор - Неопределено
//      ** МуниципальныйРайонИдентификатор - Неопределено
//      ** РайонИдентификатор - Неопределено
//      ** РегионИдентификатор - Неопределено
//   * ИдентификаторЗемельногоУчастка - Неопределено
//   * НомерЗемельногоУчастка - Неопределено
//   * ИдентификаторДома - Неопределено
//   * ИдентификаторАдресногоОбъекта - Неопределено
//   * Помещения - Массив
//   * Корпуса - Массив
//   * Здание - Структура:
//      ** Номер - Строка
//      ** ТипЗдания - Строка
//   * ЭлементДополнительнойТерриторииСокращение - Строка
//   * ЭлементДополнительнойТерритории - Строка
//   * ДополнительнаяТерриторияСокращение - Строка
//   * ДополнительнаяТерритория - Строка
//   * УлицаСокращение - Строка
//   * ТерриторияСокращение - Строка
//   * НаселенныйПунктСокращение - Строка
//   * ВнутригородскойРайонСокращение - Строка
//   * ПоселениеСокращение - Строка
//   * ГородСокращение - Строка
//   * МуниципальныйРайонСокращение - Строка
//   * РайонСокращение - Строка
//   * ОкругСокращение - Строка
//   * Округ - Строка
//   * РегионСокращение - Строка
//   * УлицаТипКраткий - Строка
//   * УлицаТипПолный - Строка
//   * Улица - Строка
//   * ТерриторияТипКраткий - Строка
//   * ТерриторияТипПолный - Строка
//   * Территория - Строка
//   * НаселенныйПунктТипКраткий - Строка
//   * НаселенныйПунктТипПолный - Строка
//   * НаселенныйПункт - Строка
//   * ВнутригородскойРайонТипКраткий - Строка
//   * ВнутригородскойРайонТипПолный - Строка
//   * ВнутригородскойРайон - Строка
//   * ПоселениеТипКраткий - Строка
//   * ПоселениеТипПолный - Строка
//   * Поселение - Строка
//   * ГородТипКраткий - Строка
//   * ГородТипПолный - Строка
//   * Город - Строка
//   * МуниципальныйРайонТипКраткий - Строка
//   * МуниципальныйРайонТипПолный - Строка
//   * МуниципальныйРайон - Строка
//   * РайонТипКраткий - Строка
//   * РайонТипПолный - Строка
//   * Район - Строка
//   * РегионТипКраткий - Строка
//   * РегионТипПолный - Строка
//   * Регион - Строка
//   * КодРегиона - Строка
//   * Индекс - Строка
//   * КодСтраны - Строка
//   * Страна - Строка
//   * МуниципальноеПредставление - Строка
//   * Представление - Строка
//   * Комментарий - Строка
//   * ТипАдреса - Строка
//
Функция КонструкторПолейАдреса() Экспорт
	
	Результат = Новый Структура;
	
	Результат.Вставить("ТипАдреса"                 , "");
	Результат.Вставить("Комментарий"               , "");
	
	Результат.Вставить("Представление"             , "");
	Результат.Вставить("МуниципальноеПредставление", "");
	
	Результат.Вставить("Страна"   , "");
	Результат.Вставить("КодСтраны", "");
	Результат.Вставить("Индекс"   , "");
	
	Результат.Вставить("КодРегиона"                               , "");
	Результат.Вставить("Регион"                                   , "");
	Результат.Вставить("РегионТипПолный"                          , "");
	Результат.Вставить("РегионТипКраткий"                         , "");
	
	Результат.Вставить("Район"                                    , "");
	Результат.Вставить("РайонТипПолный"                           , "");
	Результат.Вставить("РайонТипКраткий"                          , "");
	
	Результат.Вставить("МуниципальныйРайон"                       , "");
	Результат.Вставить("МуниципальныйРайонТипПолный"              , "");
	Результат.Вставить("МуниципальныйРайонТипКраткий"             , "");
	
	Результат.Вставить("Город"                                    , "");
	Результат.Вставить("ГородТипПолный"                           , "");
	Результат.Вставить("ГородТипКраткий"                          , "");
	
	Результат.Вставить("Поселение"                                , "");
	Результат.Вставить("ПоселениеТипПолный"                       , "");
	Результат.Вставить("ПоселениеТипКраткий"                      , "");
	
	Результат.Вставить("ВнутригородскойРайон"                     , "");
	Результат.Вставить("ВнутригородскойРайонТипПолный"            , "");
	Результат.Вставить("ВнутригородскойРайонТипКраткий"           , "");
	
	Результат.Вставить("НаселенныйПункт"                          , "");
	Результат.Вставить("НаселенныйПунктТипПолный"                 , "");
	Результат.Вставить("НаселенныйПунктТипКраткий"                , "");
	
	Результат.Вставить("Территория"                               , "");
	Результат.Вставить("ТерриторияТипПолный"                      , "");
	Результат.Вставить("ТерриторияТипКраткий"                     , "");
	
	Результат.Вставить("Улица"                                    , "");
	Результат.Вставить("УлицаТипПолный"                           , "");
	Результат.Вставить("УлицаТипКраткий"                          , "");
	
	// устаревшие свойства
	Результат.Вставить("РегионСокращение"                         , "");
	Результат.Вставить("Округ"                                    , "");
	Результат.Вставить("ОкругСокращение"                          , "");
	Результат.Вставить("РайонСокращение"                          , "");
	Результат.Вставить("МуниципальныйРайонСокращение"             , "");
	Результат.Вставить("ГородСокращение"                          , "");
	Результат.Вставить("ПоселениеСокращение"                      , "");
	Результат.Вставить("ВнутригородскойРайонСокращение"           , "");
	Результат.Вставить("НаселенныйПунктСокращение"                , "");
	Результат.Вставить("ТерриторияСокращение"                     , "");
	Результат.Вставить("УлицаСокращение"                          , "");
	Результат.Вставить("ДополнительнаяТерритория"                 , "");
	Результат.Вставить("ДополнительнаяТерриторияСокращение"       , "");
	Результат.Вставить("ЭлементДополнительнойТерритории"          , "");
	Результат.Вставить("ЭлементДополнительнойТерриторииСокращение", "");
	
	Здание = Новый Структура;
	Здание.Вставить("ТипЗдания", "");
	Здание.Вставить("Номер"    , "");
	Результат.Вставить("Здание", Здание);
	
	Результат.Вставить("Корпуса"  , Новый Массив);
	Результат.Вставить("Помещения", Новый Массив);
	
	Результат.Вставить("ИдентификаторАдресногоОбъекта"  , Неопределено);
	Результат.Вставить("ИдентификаторДома"              , Неопределено);
	Результат.Вставить("НомерЗемельногоУчастка"         , Неопределено);
	Результат.Вставить("ИдентификаторЗемельногоУчастка" , Неопределено);
	
	Идентификаторы = Новый Структура;
	Идентификаторы.Вставить("РегионИдентификатор"              , Неопределено);
	Идентификаторы.Вставить("РайонИдентификатор"               , Неопределено);
	Идентификаторы.Вставить("МуниципальныйРайонИдентификатор"  , Неопределено);
	Идентификаторы.Вставить("ГородИдентификатор"               , Неопределено);
	Идентификаторы.Вставить("ПоселениеИдентификатор"           , Неопределено);
	Идентификаторы.Вставить("ВнутригородскойРайонИдентификатор", Неопределено);
	Идентификаторы.Вставить("НаселенныйПунктИдентификатор"     , Неопределено);
	Идентификаторы.Вставить("ТерриторияИдентификатор"          , Неопределено);
	Идентификаторы.Вставить("УлицаИдентификатор"               , Неопределено);
	Результат.Вставить("Идентификаторы", Идентификаторы);
	
	ДополнительныеКоды = Новый Структура;
	ДополнительныеКоды.Вставить("ОКТМО"           , "");
	ДополнительныеКоды.Вставить("ОКАТО"           , "");
	ДополнительныеКоды.Вставить("КодИФНСФЛ"       , "");
	ДополнительныеКоды.Вставить("КодИФНСЮЛ"       , "");
	ДополнительныеКоды.Вставить("КодУчасткаИФНСФЛ", "");
	ДополнительныеКоды.Вставить("КодУчасткаИФНСЮЛ", "");
	Результат.Вставить("ДополнительныеКоды", ДополнительныеКоды);
	
	КодыКЛАДР = Новый Структура;
	КодыКЛАДР.Вставить("Регион"         , "");
	КодыКЛАДР.Вставить("Район"          , "");
	КодыКЛАДР.Вставить("Город"          , "");
	КодыКЛАДР.Вставить("НаселенныйПункт", "");
	КодыКЛАДР.Вставить("Улица"          , "");
	Результат.Вставить("КодыКЛАДР", КодыКЛАДР);
	
	Возврат Результат;

КонецФункции

// Описание национальных полей структуры контактной информации для хранения ее в формате JSON.
// Основной список полей определяется в одноименной функции общего модуля УправлениеКонтактнойИнформациейКлиентСервер.
//
//    ТипКонтактнойИнформации  - ПеречислениеСсылка.ТипыКонтактнойИнформации -
//                                Тип контактной информации, определяющий состав полей контактной информации.
//
// Возвращаемое значение:
//   Структура - поля контактной информации добавленные к основным полям:
//     Для типа контактной информации адрес:
//     * ID - Строка -  идентификационный код последнего адресного объекта в иерархи адреса.
//     * AddressType - Строка - установленный пользователем тип адреса(только для адресов РФ).
//                              Варианты: "Муниципальный", "Административно-территориальный".
//     * AreaCode - Строка - код региона РФ.
//     * AreaID - Строка - идентификатор региона.
//     * District - Строка - представление района у адресов по административно-территориальному делению.
//     * DistrictType - Строка - сокращение района у адресов по административно-территориальному делению.
//     * DistrictID - Строка - идентификатор региона у адресов по административно-территориальному делению.
//     * MunDistrict - Строка - представление муниципального района у адресов по муниципальному делению.
//     * MunDistrictType - Строка - сокращение муниципального района у адресов по муниципальному делению.
//     * MunDistrictID - Строка - идентификатор муниципального района у адресов по муниципальному делению.
//     * CityID - Строка - идентификатор муниципального города у адресов по административно-территориальному делению.
//     * Settlement - Строка - представление поселения у адресов по муниципальному делению.
//     * SettlementType - Строка - сокращение поселения у адресов по муниципальному делению.
//     * SettlementID - Строка - идентификатор поселения.
//     * CityDistrict - Строка - представление внутригородского района.
//     * CityDistrictType - Строка - сокращение внутригородского района.
//     * CityDistrictID - Строка - идентификатор внутригородского района.
//     * Territory - Строка - представление территории.
//     * TerritoryType - Строка - сокращение территории.
//     * TerritoryID - Строка - идентификатор территории.
//     * Locality - Строка - представление населенного пункта.
//     * LocalityType - Строка - сокращение населенного пункта.
//     * LocalityID - Строка - идентификатор населенного пункта.
//     * StreetID - Строка - идентификатор улицы.
//     * HouseType - Строка - тип дома, владения.
//     * HouseNumber - Строка - номер дома, владения.
//     * HouseID - Строка - идентификатор дома.
//     * Buildings - Массив - содержит структуры(поля структуры: type, number) с перечнем корпусов (строений) адреса.
//     * Apartments - Массив - содержит структуры(поля структуры: type, number) с перечнем помещений адреса.
//     * CodeKLADR - Строка - код КЛАДР.
//     * OKTMO - Строка - код ОКТМО.
//     * OKATO - Строка - код ОКАТО.
//     * IFNSFLCode - Строка - код ИФНСФЛ.
//     * IFNSULCode - Строка - код ИФНСЮЛ.
//     * IFNSFLAreaCode - Строка - код участка ИФНСФЛ.
//     * IFNSULAreaCode - Строка - код участка ИФНСЮЛ.
//
Функция ОписаниеНовойКонтактнойИнформации(Знач ТипКонтактнойИнформации) Экспорт
	
	Если ТипЗнч(ТипКонтактнойИнформации) <> Тип("ПеречислениеСсылка.ТипыКонтактнойИнформации") Тогда
		ТипКонтактнойИнформации = "";
	КонецЕсли;
	
	Результат = УправлениеКонтактнойИнформациейКлиентСервер.ОписаниеНовойКонтактнойИнформации(ТипКонтактнойИнформации);
	
	Если ТипКонтактнойИнформации = ПредопределенноеЗначение("Перечисление.ТипыКонтактнойИнформации.Адрес") Тогда
		
		Результат.Вставить("id",               "");
		Результат.Вставить("areaCode",         "");
		Результат.Вставить("areaId",           "");
		Результат.Вставить("district",         "");
		Результат.Вставить("districtType",     "");
		Результат.Вставить("districtId",       "");
		Результат.Вставить("munDistrict",      "");
		Результат.Вставить("munDistrictType",  "");
		Результат.Вставить("munDistrictId",    "");
		Результат.Вставить("cityId",           "");
		Результат.Вставить("settlement",       "");
		Результат.Вставить("settlementType",   "");
		Результат.Вставить("settlementId",     "");
		Результат.Вставить("cityDistrict",     "");
		Результат.Вставить("cityDistrictType", "");
		Результат.Вставить("cityDistrictId",   "");
		Результат.Вставить("territory",        "");
		Результат.Вставить("territoryType",    "");
		Результат.Вставить("territoryId",      "");
		Результат.Вставить("locality",         "");
		Результат.Вставить("localityType",     "");
		Результат.Вставить("localityId",       "");
		Результат.Вставить("streetId",         "");
		Результат.Вставить("houseType",        "");
		Результат.Вставить("houseNumber",      "");
		Результат.Вставить("houseId",          "");
		Результат.Вставить("buildings",        Новый Массив);
		Результат.Вставить("apartments",       Новый Массив);
		Результат.Вставить("codeKLADR",        "");
		Результат.Вставить("oktmo",            "");
		Результат.Вставить("okato",            "");
		Результат.Вставить("asInDocument",     "");
		Результат.Вставить("ifnsFLCode",       "");
		Результат.Вставить("ifnsULCode",       "");
		Результат.Вставить("ifnsFLAreaCode",   "");
		Результат.Вставить("ifnsULAreaCode",   "");
		Результат.Вставить("stead",            "");
		Результат.Вставить("steadId",          "");
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция СопоставлениеНаименованиеУровнюАдреса(ИмяУровня) Экспорт
	Уровни = Новый Соответствие;
	
	Уровни.Вставить("Area", 1);
	Уровни.Вставить("MunDistrict", 31);
	Уровни.Вставить("Settlement", 41);
	Уровни.Вставить("District", 3);
	Уровни.Вставить("City", 4);
	Уровни.Вставить("CityDistrict", 5);
	Уровни.Вставить("Locality", 6);
	Уровни.Вставить("Territory", 65);
	Уровни.Вставить("Street", 7);
	
	Возврат Уровни[ИмяУровня];
КонецФункции

Функция ИменаУровнейАдреса(ТипАдреса, ВключатьУровеньУлицы, ВключатьУровеньДома = Ложь) Экспорт
	
	Уровни = Новый Массив;
	
	Если ТипАдреса = УправлениеКонтактнойИнформациейКлиентСервер.ИностранныйАдрес() Тогда
		
		Уровни.Добавить("City");
		
	Иначе
		
		Уровни.Добавить("Area");
		Если ТипАдреса = УправлениеКонтактнойИнформациейКлиентСервер.АдресЕАЭС() Тогда
			
			Уровни.Добавить("District");
			Уровни.Добавить("City");
			Уровни.Добавить("Locality");
			
		Иначе
			
			Если ТипАдреса = "Все" Тогда
				Уровни.Добавить("District");
				Уровни.Добавить("City");
				Уровни.Добавить("MunDistrict");
				Уровни.Добавить("Settlement");
			Иначе
				Если ЭтоМуниципальныйАдрес(ТипАдреса) Тогда
					Уровни.Добавить("MunDistrict");
					Уровни.Добавить("Settlement");
				Иначе
					Уровни.Добавить("District");
					Уровни.Добавить("City");
				КонецЕсли;
			КонецЕсли;
			
			Уровни.Добавить("CityDistrict");
			Уровни.Добавить("Locality");
			Уровни.Добавить("Territory");
			
		КонецЕсли;
		
	КонецЕсли;
	
	Если ВключатьУровеньУлицы Тогда
		Уровни.Добавить("Street");
	КонецЕсли;
	
	Если ВключатьУровеньДома Тогда
		Уровни.Добавить("house");
	КонецЕсли;
	
	Возврат Уровни;
	
КонецФункции

Процедура ОбновитьПредставлениеАдреса(Адрес, ВключатьСтрануВПредставление) Экспорт
	
	Представление = ПредставлениеАдреса(Адрес, ВключатьСтрануВПредставление);
	Адрес.Value = Представление;
	
КонецПроцедуры

Функция ПредставлениеАдреса(Адрес, ВключатьСтрануВПредставление, ТипАдреса = Неопределено) Экспорт
	
	Если ТипЗнч(Адрес) <> Тип("Структура") Тогда
		ВызватьИсключение НСтр("ru = 'Для формирования представления адреса передан некорректный тип адреса'");
	КонецЕсли;
	
	Если ТипАдреса = Неопределено Тогда
		ТипАдреса = Адрес.AddressType;
	КонецЕсли;
	
	Если УправлениеКонтактнойИнформациейКлиентСервер.ЭтоАдресВСвободнойФорме(ТипАдреса) Тогда
		
		Если Не Адрес.Свойство("Country") Или ПустаяСтрока(Адрес.Country) Тогда
			Возврат Адрес.Value;
		КонецЕсли;
		
		ВПредставлениеЕстьСтрана = СтрНачинаетсяС(ВРег(Адрес.Value), ВРег(Адрес.Country));
		Если ВключатьСтрануВПредставление Тогда
			Если Не ВПредставлениеЕстьСтрана Тогда
				Возврат Адрес.Country + ", " + Адрес.Value;
			КонецЕсли;
		Иначе
			Если ВПредставлениеЕстьСтрана И СтрНайти(Адрес.Value, ",") > 0 Тогда
				СписокПолей = СтрРазделить(Адрес.Value, ",");
				СписокПолей.Удалить(0);
				Возврат СтрСоединить(СписокПолей, ",");
			КонецЕсли;
		КонецЕсли;
		
		Возврат Адрес.Value;
		
	КонецЕсли;
	
	Если УправлениеКонтактнойИнформациейКлиентСервер.ЭтоАдресВСвободнойФорме(ТипАдреса) Тогда
		Возврат ПредставлениеАдресаВСвободнойФорме(Адрес, ВключатьСтрануВПредставление);
	КонецЕсли;
	
	СписокЗаполненныхУровней = Новый Массив;
	
	НаименованиеСтраны = "";
	Если ВключатьСтрануВПредставление И Адрес.Свойство("Country") И НЕ ПустаяСтрока(Адрес.Country) Тогда
		СписокЗаполненныхУровней.Добавить(Адрес.Country);
		НаименованиеСтраны = Адрес.Country;
	КонецЕсли;
	
	Если Адрес.Свойство("ZipCode") И НЕ ПустаяСтрока(Адрес.ZipCode) Тогда
		СписокЗаполненныхУровней.Добавить(Адрес.ZipCode);
	КонецЕсли;
	
	Для каждого ИмяУровня Из ИменаУровнейАдреса(ТипАдреса, Истина) Цикл
		
		Если СтрСравнить(ИмяУровня, "locality") = 0 
			И ЭтоМуниципальныйАдрес(Адрес.AddressType)
			И ЗначениеЗаполнено(Адрес.city)
			И ПустаяСтрока(Адрес.locality) Тогда
			СписокЗаполненныхУровней.Добавить(СокрЛП(Адрес["city"] + " " + Адрес["cityType"]));
			
		ИначеЕсли Адрес.Свойство(ИмяУровня) И НЕ ПустаяСтрока(Адрес[ИмяУровня]) Тогда
			Если НЕ ПредставлениеУровняБезСокращения(ИмяУровня) Тогда
				СписокЗаполненныхУровней.Добавить(СокрЛП(Адрес[ИмяУровня] + " " + Адрес[ИмяУровня + "Type"]));
			Иначе
				СписокЗаполненныхУровней.Добавить(Адрес[ИмяУровня]);
			КонецЕсли;
		КонецЕсли;
		
	КонецЦикла;
	
	Если Адрес.Свойство("HouseNumber") И НЕ ПустаяСтрока(Адрес.HouseNumber) Тогда
		СписокЗаполненныхУровней.Добавить(НРег(Адрес.HouseType) + " " + Адрес.HouseNumber);
	ИначеЕсли Адрес.Свойство("stead") И Не ПустаяСтрока(Адрес.stead) Тогда
		СписокЗаполненныхУровней.Добавить("участок" + " " + Адрес.stead);
	КонецЕсли;
	
	Если Адрес.Свойство("Buildings") И Адрес.Buildings.Количество() > 0 Тогда
		
		Для каждого Строение Из Адрес.Buildings Цикл
			Если ЗначениеЗаполнено(Строение.Number) Тогда
				СписокЗаполненныхУровней.Добавить(НРег(Строение.Type) + " " + Строение.Number);
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;
	
	Если Адрес.Свойство("Apartments")
		И Адрес.Apartments <> Неопределено
		И Адрес.Apartments.Количество() > 0 Тогда
		
		Для каждого Строение Из Адрес.Apartments Цикл
			Если ЗначениеЗаполнено(Строение.Number) Тогда
				Если СтрСравнить(Строение.Type, "Другое") <> 0 Тогда
					СписокЗаполненныхУровней.Добавить(НРег(Строение.Type) + " " + Строение.Number);
				Иначе
					СписокЗаполненныхУровней.Добавить(Строение.Number);
				КонецЕсли;
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;
	
	Представление = СтрСоединить(СписокЗаполненныхУровней, ", ");
	
	Возврат Представление;
	
КонецФункции

Функция НаименованиеЗемельногоУчастка() Экспорт
	Возврат "Зем. участок";
КонецФункции

#Область ПрочиеСлужебныеПроцедурыИФункции

Функция ПредставлениеУровняБезСокращения(ИмяУровня) Экспорт
	
	Если СтрСравнить(ИмяУровня, "MunDistrict") = 0 
			Или СтрСравнить(ИмяУровня, "Settlement") = 0 Тогда
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
	
КонецФункции

Функция ПредставлениеАдресаВСвободнойФорме(Знач Адрес, Знач ВключатьСтрануВПредставление)
	
	Если ВключатьСтрануВПредставление И Адрес.Свойство("Country") И НЕ ПустаяСтрока(Адрес.Country) Тогда
		ЧастиАдреса = СтрРазделить(Адрес.Value, ",");
		Если ЗначениеЗаполнено(Адрес.Value) И СтрСравнить(ЧастиАдреса[0], Адрес.Country) = 0 Тогда
			ЧастиАдреса.Удалить(0);
			Адрес.Value = СтрСоединить(ЧастиАдреса, ",");
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат Адрес.Value;
	
КонецФункции

// Возвращает пустую структура адреса.
//
// Возвращаемое значение:
//    Структура - адрес, ключи - имена полей, значения поля.
//
Функция СтруктураПолейАдреса(ФорматАдреса)
	
	СтруктураАдреса = Новый Структура;
	СтруктураАдреса.Вставить("Представление", "");
	СтруктураАдреса.Вставить("Страна", "");
	СтруктураАдреса.Вставить("НаименованиеСтраны", "");
	СтруктураАдреса.Вставить("КодСтраны","");
	СтруктураАдреса.Вставить("Индекс","");
	СтруктураАдреса.Вставить("Регион","");
	СтруктураАдреса.Вставить("РегионСокращение","");
	СтруктураАдреса.Вставить("Район","");
	СтруктураАдреса.Вставить("РайонСокращение","");
	СтруктураАдреса.Вставить("Город","");
	СтруктураАдреса.Вставить("ГородСокращение","");
	СтруктураАдреса.Вставить("НаселенныйПункт","");
	СтруктураАдреса.Вставить("НаселенныйПунктСокращение","");
	СтруктураАдреса.Вставить("Улица","");
	СтруктураАдреса.Вставить("УлицаСокращение","");
	СтруктураАдреса.Вставить("Дом","");
	СтруктураАдреса.Вставить("Корпус","");
	СтруктураАдреса.Вставить("Квартира","");
	СтруктураАдреса.Вставить("ТипДома","");
	СтруктураАдреса.Вставить("ТипКорпуса","");
	СтруктураАдреса.Вставить("ТипКвартиры","");
	СтруктураАдреса.Вставить("НаименованиеВида","");
	
	Если ВРег(ФорматАдреса) = "ФИАС" Тогда
		СтруктураАдреса.Вставить("Округ","");
		СтруктураАдреса.Вставить("ОкругСокращение","");
		СтруктураАдреса.Вставить("ВнутригородскойРайон","");
		СтруктураАдреса.Вставить("ВнутригородскойРайонСокращение","");
	КонецЕсли;
	
	Возврат СтруктураАдреса;
	
КонецФункции

#КонецОбласти

#КонецОбласти